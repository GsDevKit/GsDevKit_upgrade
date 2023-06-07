prepare gsdevkit  image
prepareGsDevKitImage_removeObsoleteClasses
	"remove obsolete classes (those now implemented in base image, from GsDevKit image (upgradeSymbolDict) 
		and recompile methods that reference the obsolete class"

	"see https://github.com/GsDevKit/GsDevKit_upgrade/issues/29"

	"these obsolete GsDevKit classes are now present in the GemStone base 3.7.0 image and the GsDevKit implementations need to be removed"

	| obsoleteClassNames classOrganizer gsDevKitSymbolDict gsDevKitSymbolDictName |
	self
		timeStampedLog:
			'Prepare gsdevkit - recompile remove obsolete classes (those replaced by base image) and recompile references to each class'.
	obsoleteClassNames := #(#'ZnCharacterWriteStream' #'ZnCharacterReadStream' #'ZnUTF8Encoder' #'ZnCharacterEncoder' #'ZnBufferedWriteStream' #'ZnBufferedReadStream' #'ZnCharacterEncodingError').
	classOrganizer := ClassOrganizer newExcludingGlobals.	"exclude Globals, impossible to for Globals to have methods referencing GsDevKit methods"
	gsDevKitSymbolDict := self upgradeSymbolDict.
	gsDevKitSymbolDictName := gsDevKitSymbolDict name asString.
	obsoleteClassNames
		do: [ :obsoleteClassName | 
			(gsDevKitSymbolDict at: obsoleteClassName ifAbsent: [  ])
				ifNil: [ 
					self
						log:
							'	ignoring class ' , obsoleteClassName
								, ' that are not in upgrade symbol dictionary ' , gsDevKitSymbolDictName ]
				ifNotNil: [ :obsoleteClass | 
					self log: '	remove ' , obsoleteClass , ' from ' , gsDevKitSymbolDictName.
					gsDevKitSymbolDict removeKey: obsoleteClass.
					self log: '	scanning for methods referencing ' , obsoleteClassName.
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