Class {
	#name : 'GsuAbstractGsDevKit',
	#superclass : 'Object',
	#instVars : [
		'upgradeUserName',
		'upgradeSymbolDict',
		'upgradeSymbolDictName',
		'bootstrapPostLoadClassList',
		'bootstrapRepositoryDirectory',
		'bootstrapApplicationLoadSpecs',
		'bootstrapExistingConfigurationList'
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
GsuAbstractGsDevKit >> _defaultBootstrapApplicationLoadSpecs [
	"formerly BootstrapApplicationLoadSpecs, bootstrap GLASS configuration name, version, load spec and directory path"

	^ {
		'ConfigurationOfGLASS'. 
		'1.0-beta.9.2.2'. 
		#('default'). 
		nil.	"nill - use bootstrapRepositoryDirectory"
	}
]

{ #category : 'private' }
GsuAbstractGsDevKit >> _defaultBootstrapPostLoadClassList [
	"formerly BootstrapApplicationPostloadClassList, list of classes that should not be initialized during bootstrap"

	^ #( #SecureHashAlgorithm #MCFileTreeFileDirectoryUtils )
]

{ #category : 'private' }
GsuAbstractGsDevKit >> _defaultBootstrapRepositoryDirectory [
	"formerly BootstrapRepositoryDirectory, location of Monticello bootstrap directory"

	^ GsPackageLibrary getMonticelloRepositoryDirectory
]

{ #category : 'private' }
GsuAbstractGsDevKit >> _gemstone_user [

	^ self class gemstone_user
]

{ #category : 'private' }
GsuAbstractGsDevKit >> _globalNamed: aString [

	^ GsSession currentSession objectNamed: aString
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

{ #category : 'accessing' }
GsuAbstractGsDevKit >> bootstrapApplicationLoadSpecs [
	"formerly BootstrapApplicationLoadSpecs, bootstrap GLASS configuration name, version, load spec and directory path"

	^ bootstrapApplicationLoadSpecs
		ifNil: [ bootstrapApplicationLoadSpecs := self _defaultBootstrapApplicationLoadSpecs ]
]

{ #category : 'accessing' }
GsuAbstractGsDevKit >> bootstrapApplicationLoadSpecs: loadSpecArray [
	"formerly BootstrapApplicationLoadSpecs, bootstrap GLASS configuration name, version, load spec and directory path"

	bootstrapApplicationLoadSpecs := loadSpecArray
]

{ #category : 'accessing' }
GsuAbstractGsDevKit >> bootstrapExistingConfigurationList [
	"formerly BootstrapExistingConfigurationList, list of configuration names that should be removed"

	^ bootstrapExistingConfigurationList
		ifNil: [ bootstrapExistingConfigurationList := {} ]
]

{ #category : 'accessing' }
GsuAbstractGsDevKit >> bootstrapExistingConfigurationList: configurationNames [
	"formerly BootstrapExistingConfigurationList, list of configuration names that should be removed"

	bootstrapExistingConfigurationList := configurationNames
]

{ #category : 'accessing' }
GsuAbstractGsDevKit >> bootstrapPostLoadClassList [
	"formerly BootstrapApplicationPostloadClassList, list of classes that should not be initialized during bootstrap"

	^ bootstrapPostLoadClassList
		ifNil: [ bootstrapPostLoadClassList := self _defaultBootstrapPostLoadClassList ]
]

{ #category : 'accessing' }
GsuAbstractGsDevKit >> bootstrapPostLoadClassList: aListOfClassNameSymbols [
	"formerly BootstrapApplicationPostloadClassList, list of application classes that should not be initialized during bootstrap"

	"make sure that the _default list are included ... they are required"

	bootstrapPostLoadClassList := ( aListOfClassNameSymbols, self _defaultBootstrapPostLoadClassList) asIdentitySet asArray
]

{ #category : 'accessing' }
GsuAbstractGsDevKit >> bootstrapRepositoryDirectory [
	"formerly BootstrapRepositoryDirectory, location of Monticello bootstrap directory"

	^ bootstrapRepositoryDirectory
		ifNil: [ bootstrapRepositoryDirectory := self _defaultBootstrapRepositoryDirectory ]
]

{ #category : 'accessing' }
GsuAbstractGsDevKit >> bootstrapRepositoryDirectory: directoryPath [
	"formerly BootstrapRepositoryDirectory, location of Monticello bootstrap directory"

	bootstrapRepositoryDirectory := directoryPath
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

{ #category : 'accessing' }
GsuAbstractGsDevKit >> upgradeUserProfile [

	^ (AllUsers userWithId: self upgradeUserName)
]
