Class {
	#name : 'GsuGsDevKitBootstrap',
	#superclass : 'GsuAbstractGsDevKit',
	#instVars : [
		'bootstrapGemStoneRelease'
	],
	#category : 'GsDevKit_upgradeDevKitImage-Bootstrap'
}

{ #category : 'instance creation' }
GsuGsDevKitBootstrap class >> upgradeUserName: aString upgradeSymbolDictName: aSymbol bootstrapGemStoneRelease: bootstrapRelease [

	^ (self
			upgradeUserName: aString
				upgradeSymbolDictName: aSymbol)
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

	| undef |
	self log: '	bootstrap GsdevKit'.

	"Bug 46217 - during bootstrap don't remove any classes.
		during initial bootstrap no classes will be removed
		during upgrade unexpected classes should not be removed during the
		bootstrap operation"
	self _currentUserGlobals at: #'GS_BOOTSTRAP_MONTICELLO_SKIP_REMOVE_CLASS' put: true.

	undef := SymbolDictionary new.
	undef name: #UndefinedSymbols.
	self _currentUserGlobals at: #UndefinedSymbols put: undef.
	self _currentUserGlobals at: #UndefinedSymbolList put: (SymbolList with: undef).

	GsPackagePolicy current enable.

	"patch Class>>removeFromSystem until upgrade is complete, will be repaired during load"
	self log: '	patching patch Class>>removeFromSystem'.
	Class
		compileMethod: self _bootstrap_class_removeFromSystem_patchSource 
		dictionaries: self upgradeUserProfile symbolList 
		category: '*change-notification'.

	"Remove the known list of Metacello configuration classes (they have had their
		methods removed and need to be reloaded."
	ClassOrganizer clearCachedOrganizer.
	self log: '	removing configuration classes'.
	self bootstrapExistingConfigurationList do: [:class | 
		self log: '		', class name.
		class removeFromSystem ].
	self log: '	done removing configuration classes'.

	"set the cache repository"
	(self _globalNamed: 'MCCacheRepository') 
		ifNotNil: [:mCCacheRepository | 
			mCCacheRepository setDefault: (self _globalNamed: 'MCDictionaryRepository') new ].
]
