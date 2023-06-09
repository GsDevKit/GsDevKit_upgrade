Class {
	#name : 'GsuGsDevKit_3_7_x_Upgrade',
	#superclass : 'GsuGsDevKit_3_6_x_Upgrade',
	#category : 'GsDevKit_upgrade-Core'
}

{ #category : 'private' }
GsuGsDevKit_3_7_x_Upgrade >> _defaultTargetRelease [

	^ GsuGemStone_3_7_x_Release major: 3 minor: 7  patch: self _patchRelease
]

{ #category : 'private' }
GsuGsDevKit_3_7_x_Upgrade >> _moveClassNamed: className toNewSuperclassNamed: superclassName [
	| definition oldClass newClass |
	oldClass := self upgradeSymbolDict at: className.
	definition := oldClass
		definitionWithClassName: className
		superClassName: superclassName.
	newClass := definition evaluate.
	newClass
		copyMethodsFrom: oldClass
		dictionaries: GsSession currentSession symbolList
]

{ #category : 'prepare gsdevkit  image' }
GsuGsDevKit_3_7_x_Upgrade >> prepareGsDevKitImage_bug49622_patch [
	"Bug 49622 - starting in 3.7.0 ReadByteStream an optimized version of ReadStream should be used 
		in GLASS applications instead of AnsiReadStream in SequenceableCollection snf String"

	| category |
	category := #'49622 patch'.
	self timeStampedLog: 'Prepare gsdevkit - patch 49622'.

	(SequenceableCollection
		compileMethod: 'readStream ^ AnsiReadStream on: self'
		dictionaries: self upgradeUserProfile symbolList
		category: category) ifNotNil: [ :ar | self error: 'did not compile' ].

	(String
		compileMethod: 'readStream ^ AnsiReadStream on: self'
		dictionaries: self upgradeUserProfile symbolList
		category: category) ifNotNil: [ :ar | self error: 'did not compile' ].
]

{ #category : 'prepare gsdevkit  image' }
GsuGsDevKit_3_7_x_Upgrade >> prepareGsDevKitImage_removeObsoleteClasses [
	"remove obsolete classes (those now implemented in base image, from GsDevKit image (upgradeSymbolDict) 
		and recompile methods that reference the obsolete class"

	"see https://github.com/GsDevKit/GsDevKit_upgrade/issues/29"

	"these obsolete GsDevKit classes are now present in the GemStone base 3.7.0 image and the GsDevKit implementations need to be removed"

	| obsoleteClassNames classOrganizer gsDevKitSymbolDict gsDevKitSymbolDictName assocs |
	self
		timeStampedLog:
			'Prepare gsdevkit - recompile remove obsolete classes (those replaced by base image) and recompile references to each class'.
	obsoleteClassNames := #(#'ZnCharacterWriteStream' #'ZnCharacterReadStream' #'ZnUTF8Encoder' #'ZnCharacterEncoder' #'ZnBufferedWriteStream' #'ZnBufferedReadStream' #'ZnCharacterEncodingError').
	classOrganizer := ClassOrganizer newExcludingGlobals.	"exclude Globals, impossible to for Globals to have methods referencing GsDevKit methods"
	gsDevKitSymbolDict := self upgradeSymbolDict.
	gsDevKitSymbolDictName := gsDevKitSymbolDict name asString.
	self
		_deploy: [ 
			[ 
			self
				log:
					'	moving ZnInvalidUTF8, ZnNullEncoder, and ZnByteEncoder to their new superclasses in GemStone base'.
			assocs := {#'ZnCharacterEncodingError'.
			#'ZnCharacterEncoder'}
				collect: [ :className | 
					"we need to do the migration of instances at the very end of the process"
					gsDevKitSymbolDict removeAssociationAt: className ].
			self
				_moveClassNamed: #'ZnInvalidUTF8'
				toNewSuperclassNamed: #'ZnCharacterEncodingError'.
			self
				_moveClassNamed: #'ZnNullEncoder'
				toNewSuperclassNamed: #'ZnCharacterEncoder'.
			self
				_moveClassNamed: #'ZnByteEncoder'
				toNewSuperclassNamed: #'ZnCharacterEncoder' ]
				ensure: [ assocs do: [ :assoc | gsDevKitSymbolDict addAssocation: assoc ] ] ].
	obsoleteClassNames
		do: [ :obsoleteClassName | 
			(gsDevKitSymbolDict at: obsoleteClassName ifAbsent: [  ])
				ifNil: [ 
					self
						log:
							'	ignoring class ' , obsoleteClassName
								, ' that are not in upgrade symbol dictionary ' , gsDevKitSymbolDictName ]
				ifNotNil: [ :obsoleteClass | 
					self log: '	remove ' , obsoleteClassName , ' from ' , gsDevKitSymbolDictName.
					obsoleteClass removeFromSystem.
					self log: '	scanning for methods referencing ' , obsoleteClassName.	"method references to the innocentBystanders will be repaired 
								when they are reloaded into the image"
					(classOrganizer referencesToObject: obsoleteClass)
						do: [ :aGsNMethod | 
							self
								log:
									'	recompiling ' , aGsNMethod inClass name , ' >> ' , aGsNMethod selector.
							aGsNMethod recompileFromSource ] ] ].
	System commit.
	self
		log:
			'	done removing obsolete classes and recompiling methods with references to obsolete classes.. (commit)'
]
