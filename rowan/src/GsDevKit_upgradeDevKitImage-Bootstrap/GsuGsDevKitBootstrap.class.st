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
]
