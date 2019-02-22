Class {
	#name : 'GsuAbstractGsDevKit',
	#superclass : 'Object',
	#instVars : [
		'upgradeUserName',
		'upgradeSymbolDict',
		'upgradeSymbolDictName'
	],
	#category : 'GsDevKit_upgradeDevKitImage-Common'
}

{ #category : 'accessing' }
GsuAbstractGsDevKit class >> gemstone_user [

	^ (System gemEnvironmentVariable: 'GEMSTONE_USER')
		ifNil: [ 'DataCurator' ]
]

{ #category : 'instance creation' }
GsuAbstractGsDevKit class >> upgradeUserName: aString upgradeSymbolDictName: aSymbol [

	^ self new
		upgradeUserName: aString;
		upgradeSymbolDictName: aSymbol;
		yourself
]

{ #category : 'private' }
GsuAbstractGsDevKit >> _currentUserGlobals [

	^ GsSession currentSession objectNamed: #UserGlobals
]

{ #category : 'private' }
GsuAbstractGsDevKit >> _gemstone_user [

	^ self class gemstone_user
]

{ #category : 'logging' }
GsuAbstractGsDevKit >> bannerLog: aString [

	self bannerLogDash.
	self log: aString.
	self bannerLogDash.
]

{ #category : 'logging' }
GsuAbstractGsDevKit >> bannerLogDash [

	self log: '--------------------'.
]

{ #category : 'logging' }
GsuAbstractGsDevKit >> log: aString [

	GsFile gciLogServer: aString
]

{ #category : 'accessing' }
GsuAbstractGsDevKit >> upgradeSymbolDict [
	"Formerly known as BootstrapSymbolDictionary ... the symbol dictionary where GsDevKit/GLASS is installed"

	^ upgradeSymbolDict ifNil: [ upgradeSymbolDict:= (AllUsers userWithId: self upgradeUserName) symbolList objectNamed: self upgradeSymbolDictName ]
]

{ #category : 'accessing' }
GsuAbstractGsDevKit >> upgradeSymbolDictName [
	"Formerly known as BootstrapSymbolDictionaryName ... the name of the symbol dictionary where GsDevKit/GLASS is installed"

	^ upgradeSymbolDictName ifNil: [ #UserGlobals ]
]

{ #category : 'accessing' }
GsuAbstractGsDevKit >> upgradeSymbolDictName: aSymbol [
	"Formerly known as BootstrapSymbolDictionaryName ... the name of the symbol dictionary where GsDevKit/GLASS is installed"

	^ upgradeSymbolDictName := aSymbol
]

{ #category : 'accessing' }
GsuAbstractGsDevKit >> upgradeUserName [

	^ upgradeUserName ifNil: [ upgradeUserName := self _gemstone_user ]
]

{ #category : 'accessing' }
GsuAbstractGsDevKit >> upgradeUserName: aString [

	upgradeUserName := aString
]
