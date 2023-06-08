Class {
	#name : 'GsuGsDevKit_3_7_x_Upgrade',
	#superclass : 'GsuGsDevKit_3_6_x_Upgrade',
	#category : 'GsDevKit_upgrade-Core'
}

{ #category : 'private' }
GsuGsDevKit_3_7_x_Upgrade >> _defaultTargetRelease [

	^ GsuGemStone_3_7_x_Release major: 3 minor: 7  patch: self _patchRelease
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

	| obsoleteClassNames classOrganizer gsDevKitSymbolDict gsDevKitSymbolDictName innocentBystanders |
	self
		timeStampedLog:
			'Prepare gsdevkit - recompile remove obsolete classes (those replaced by base image) and recompile references to each class'.
	obsoleteClassNames := #(#'ZnCharacterWriteStream' #'ZnCharacterReadStream' #'ZnUTF8Encoder' #'ZnCharacterEncoder' #'ZnBufferedWriteStream' #'ZnBufferedReadStream' #'ZnCharacterEncodingError').
	innocentBystanders := #(#'ZnInvalidUTF8' #'ZnNullEncoder' #'ZnByteEncoder').
	classOrganizer := ClassOrganizer newExcludingGlobals.	"exclude Globals, impossible to for Globals to have methods referencing GsDevKit methods"
	gsDevKitSymbolDict := self upgradeSymbolDict.
	gsDevKitSymbolDictName := gsDevKitSymbolDict name asString.
	innocentBystanders , obsoleteClassNames
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
					false
						ifTrue: [ 
							"with removeFromSystem, the removed classes are automatically added to 
								UndefinedSystems, so recompile will be automatic when the new classes 
								come into the system ... so skip the recompile"
							self log: '	scanning for methods referencing ' , obsoleteClassName.
							(classOrganizer referencesToObject: obsoleteClass)
								do: [ :aGsNMethod | 
									self
										log:
											'	recompiling ' , aGsNMethod inClass name , ' >> ' , aGsNMethod selector.
									aGsNMethod recompileFromSource ] ] ] ].
	System commit.
	self
		log:
			'	done removing obsolete classes and recompiling methods with references to obsolete classes.. (commit)'
]
