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

{ #category : 'private' }
GsuGsDevKit_3_7_x_Upgrade >> _prepareImage_class__optionsForDefinition_patchSource [

	^  '_optionsForDefinition
  "in 3.6 Class>>_optionsForDefinition was replaced by Class>>_optionsStringForDefinition ... in 3.7, this became a problem. Both are in the Core package"
	^ self _optionsStringForDefinition'
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
GsuGsDevKit_3_7_x_Upgrade >> prepareGsDevKitImage_patch__optionsForDefinition [
	"_optionsForDefinition replaced by _optionsStringForDefinition in 3.6. Not used during upgrade until 3.7.0 upgrade. See _moveClassNamed:toNewSuperclassNamed:"

	self prepareImage_user_patch_Class__optionsForDefinition
]

{ #category : 'prepare gsdevkit  image' }
GsuGsDevKit_3_7_x_Upgrade >> prepareGsDevKitImage_removeObsoleteClasses [
	"remove obsolete classes (those now implemented in base image, from GsDevKit image (upgradeSymbolDict) 
		and recompile methods that reference the obsolete class"

	"see https://github.com/GsDevKit/GsDevKit_upgrade/issues/29"

	"these obsolete GsDevKit classes are now present in the GemStone base 3.7.0 image and the GsDevKit implementations need to be removed"

	| obsoleteClassNames classOrganizer gsDevKitSymbolDict gsDevKitSymbolDictName assocs |
	gsDevKitSymbolDict := self upgradeSymbolDict.
	obsoleteClassNames := #(#'ZnCharacterWriteStream' #'ZnCharacterReadStream' #'ZnUTF8Encoder' #'ZnCharacterEncoder' #'ZnBufferedWriteStream' #'ZnBufferedReadStream' #'ZnCharacterEncodingError')
		select: [ :className | gsDevKitSymbolDict includesKey: className ].
	obsoleteClassNames isEmpty
		ifTrue: [ 
			self timeStampedLog: 'Prepare gsdevkit - no obsolete Zinc classes present'.
			^ self ].
	classOrganizer := ClassOrganizer new.
	gsDevKitSymbolDictName := gsDevKitSymbolDict name asString.
	self
		timeStampedLog:
			'Prepare gsdevkit - recompile remove obsolete Zinc classes (those replaced by base image) and recompile references to each class'.
	self
		_deploy: [ 
			"instance migration for the instances of ZnInvalidUTF8, ZnNullEncoder, and ZnByteEncoder"
			[ 
			self
				log:
					'	moving ZnInvalidUTF8, ZnNullEncoder, and ZnByteEncoder to their new superclasses in GemStone base'.
			assocs := {#'ZnCharacterEncodingError'.
			#'ZnCharacterEncoder'}
				collect: [ :className | 
					| assoc |
					assoc := gsDevKitSymbolDict associationAt: className.
					gsDevKitSymbolDict removeAssociation: assoc.
					assoc ].
			self
				_moveClassNamed: #'ZnInvalidUTF8'
				toNewSuperclassNamed: #'ZnCharacterEncodingError'.
			self
				_moveClassNamed: #'ZnNullEncoder'
				toNewSuperclassNamed: #'ZnCharacterEncoder'.
			self
				_moveClassNamed: #'ZnByteEncoder'
				toNewSuperclassNamed: #'ZnCharacterEncoder' ]
				ensure: [ assocs do: [ :assoc | gsDevKitSymbolDict addAssociation: assoc ] ] ].
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

{ #category : 'prepare image user' }
GsuGsDevKit_3_7_x_Upgrade >> prepareImage_user_patch_Class__optionsForDefinition [
	"_optionsForDefinition replaced by _optionsStringForDefinition in 3.6. Not used during upgrade until 3.7.0. See _moveClassNamed:toNewSuperclassNamed:"

	self
		timeStampedLog:
			'	patch Class >> _optionsForDefinition in category *core' , ' as ' , System myUserProfile userId.
	[ 
	Class
		compileMethod: self _prepareImage_class__optionsForDefinition_patchSource
		category: '*core'
		using: self upgradeUserProfile symbolList ]
		onException: CompileError
		do: [ :ex | 
			self
				error:
					'Did not compile:
' , (GsNMethod _sourceWithErrors: ex errorDetails fromString: ex sourceString) ]
]
