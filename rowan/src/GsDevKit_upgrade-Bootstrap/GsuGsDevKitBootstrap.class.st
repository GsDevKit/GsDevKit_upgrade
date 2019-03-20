Class {
	#name : 'GsuGsDevKitBootstrap',
	#superclass : 'GsuAbstractGsDevKit',
	#instVars : [
		'bootstrapGemStoneRelease'
	],
	#category : 'GsDevKit_upgrade-Bootstrap'
}

{ #category : 'instance creation' }
GsuGsDevKitBootstrap class >> upgradeUserName: aString upgradeSymbolDictName: aSymbol bootstrapGemStoneRelease: bootstrapRelease [

	^ (self new
			upgradeUserName: aString;
			upgradeSymbolDictName: aSymbol;
			yourself)
				bootstrapGemStoneRelease: bootstrapRelease;
				yourself
]

{ #category : 'private' }
GsuGsDevKitBootstrap >> _bootstrap_class_removeFromSystem_patchSource [

	^  'removeFromSystem
  | ar |
ar := System myUserProfile dictionaryAndSymbolOf: self.
ar ifNotNil: [ (ar at: 1) removeKey: (ar at: 2) ].'
]

{ #category : 'private' }
GsuGsDevKitBootstrap >> _bootstrap_positionableStream_original_contents_patchSource [

	^  'originalContents
	"Answer the receiver''s actual contents collection, NOT a copy. 1/29/96 sw"'
]

{ #category : 'private' }
GsuGsDevKitBootstrap >> _listUpgradeParameters [

	^ #( bootstrapPostLoadClassList bootstrapApplicationLoadSpecs bootstrapExistingConfigurationList )
]

{ #category : 'private' }
GsuGsDevKitBootstrap >> _removeClassNamed: className [

	self log: '	Attempt to remove ', className printString.
	(self _globalNamed: className)
		ifNotNil: [:theClass | 
			theClass subclasses isEmpty
				ifTrue: [
					(System myUserProfile dictionariesAndSymbolsOf: theClass ) 
						do: [:ar | 
							(ar at: 1) removeKey: (ar at: 2).
							self log: '		remove class named ', (ar at: 2) printString, ' from symbol dictionary ', (ar at: 1) name printString ] ]
				ifFalse: [ self log: '		DID NOT remove class named: ', className printString ] ]
]

{ #category : 'accessing' }
GsuGsDevKitBootstrap >> bootstrapGemStoneRelease [

	^ bootstrapGemStoneRelease
]

{ #category : 'accessing' }
GsuGsDevKitBootstrap >> bootstrapGemStoneRelease: aGsuAbstractGemStoneRelease [

	^ bootstrapGemStoneRelease := aGsuAbstractGemStoneRelease
]

{ #category : 'bootstrapping' }
GsuGsDevKitBootstrap >> bootstrapGsDevkit [

	"install GsdevKit from scratch"

	"used to create extent0.seaside.dbf"

	self log: '	bootstrap GsDevKit'.

	"Bug 46217 - during bootstrap don't remove any classes.
		during initial bootstrap no classes will be removed
		during upgrade unexpected classes should not be removed during the
		bootstrap operation"
	self _currentUserGlobals at: #'GS_BOOTSTRAP_MONTICELLO_SKIP_REMOVE_CLASS' put: true.

	self bootstrapMaster.
	self patchMaster.

	"Bug 46217"
	self _currentUserGlobals  removeKey: #'GS_BOOTSTRAP_MONTICELLO_SKIP_REMOVE_CLASS' ifAbsent: [].

	"Bulk migrate instances of classes that have new class versions 
		in their class history and clean up class history. 

		(probably ought to use the page-based migrate scheme to avoid
	running out of memory)"
	self log: '	GsDeployer bulkMigrate'.
	(self _globalNamed: 'GsDeployer') bulkMigrate: [].
	self log: '	done bulkMigrate'.

	"patch Class>>removeFromSystem until upgrade is complete, will be repaired during load"
	self log: '	patching patch Class>>removeFromSystem'.
	(Class
		compileMethod: self _bootstrap_class_removeFromSystem_patchSource 
		dictionaries: self upgradeUserProfile symbolList 
		category: '*change-notification') ifNotNil: [:ar | self error: 'did not compile' ].

	self log: '	... done bootstrap GsdevKit'.
]

{ #category : 'bootstrapping' }
GsuGsDevKitBootstrap >> bootstrapMaster [
	"formerly $upgradeDir/bootstrapMaster30.topaz"

	| undef |
	self log: '	bootstrap master'.

	self logBootstrapParameters.

	undef := SymbolDictionary new.
	undef name: #UndefinedSymbols.
	self _currentUserGlobals at: #UndefinedSymbols put: undef.
	self _currentUserGlobals at: #UndefinedSymbolList put: (SymbolList with: undef).

	GsPackagePolicy current enable.

	"Patch for bug 44262"
	GsPackageLibrary 
	  installMonticelloPackagesHome: self upgradeSymbolDict
	  during: [:ignored |
		"put PositionableStream>>originalContents in session methods"
		(PositionableStream 
		  compileMethod: self _bootstrap_positionableStream_original_contents_patchSource 
		  dictionaries: GsCurrentSession currentSession symbolList 
		  category: '*squeak') ifNotNil: [:ar | self error: 'did not compile' ] ].

	"removing list of classes in GLASS1 packages, but not GLASS bootstrap packages ... classes will 
		be re-added and all methods will be recomplied that may have referenced these classes"
	#( 'GsFailedMethodCompilationDuringCopyMethodToNewClass' 'GsNonmigratingDeployer' )
		do: [:className |
			self _removeClassNamed: className ].

	"enable the GsPackages that were disabled during upgradeImage (this is 3.5.0 and beyond specific)"
	self upgradeUserProfile symbolList do:[:dict | | dName |
		dName := dict name ifNil:[ 'unnamed' ].
		(dict at: GsPackage globalName otherwise: nil) ifNotNil:[:pkg |
			pkg name == #SessionMethods 
				ifFalse:[
					pkg removeAllMethods .
					pkg enable .
					self log: '	', pkg name asString, ' enabled' ] ] ].

	System commit.

	self bootstrapGemStoneRelease bootstrapPackageFileNames do: [:bootstrapPackageFileName |
		GsPackageLibrary 
			loadMCZFile: bootstrapPackageFileName
			home: self upgradeSymbolDictName
			fromRepositoryPath: self bootstrapRepositoryDirectory ].

	self log: '	... done bootstrap master'.
]

{ #category : 'logging' }
GsuGsDevKitBootstrap >> logBootstrapParameters [

	self log: 'Bootstrap parameters'.

	self bannerLogDash.

	self _logUpgradeParameters.

	self bannerLogDash.
]

{ #category : 'bootstrapping' }
GsuGsDevKitBootstrap >> patchMaster [
	"formerly $upgradeDir/patchMaster30.topaz"

	self log: '	patch master'.
	self log: '	... done patch master'.
]
