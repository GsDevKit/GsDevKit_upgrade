"
for more information see https://github.com/GsDevKit/gsUpgrader#gsupgrader-
"
Class {
	#name : 'GsUpgrader',
	#superclass : 'Object',
	#instVars : [
		'gsUpgraderCacheDirPath',
		'repositoryOverride'
	],
	#category : 'GsUpgrader-Core'
}

{ #category : 'private' }
GsUpgrader class >> _cacheSentinelExists: gsUpgraderCacheDirPath forVersion: gemstoneVersion [
  | cacheBaseDir |
  cacheBaseDir := self _upgradeGLASSCacheBaseDir: gsUpgraderCacheDirPath.
  ^ cacheBaseDir fileExists: gemstoneVersion , '_sentinel'

]

{ #category : 'private' }
GsUpgrader class >> _createCacheSentinel: gsUpgraderCacheDirPath forVersion: gemstoneVersion [
  | cacheBaseDir |
  cacheBaseDir := self _upgradeGLASSCacheBaseDir: gsUpgraderCacheDirPath.
  (cacheBaseDir forceNewFileNamed: gemstoneVersion , '_sentinel') close

]

{ #category : 'private' }
GsUpgrader class >> _globalNamed: aString [

	^ GsSession currentSession objectNamed: aString
]

{ #category : 'private' }
GsUpgrader class >> _MCCacheRepository [

	^ self _globalNamed: 'MCCacheRepository'
]

{ #category : 'private' }
GsUpgrader class >> _MCDirectoryRepository [

	^ self _globalNamed: 'MCDirectoryRepository'
]

{ #category : 'private' }
GsUpgrader class >> _MCHttpRepository [

	^ self _globalNamed: 'MCHttpRepository'
]

{ #category : 'private' }
GsUpgrader class >> _MCPlatformSupport [

	^ self _globalNamed: 'MCPlatformSupport'
]

{ #category : 'private' }
GsUpgrader class >> _MetacelloPlatform [

	^ self _globalNamed: 'MetacelloPlatform'
]

{ #category : 'private' }
GsUpgrader class >> _MetacelloProjectRegistration [

	^ self _globalNamed: 'MetacelloProjectRegistration'
]

{ #category : 'private' }
GsUpgrader class >> _ServerFileDirectory [

	^ self _globalNamed: 'ServerFileDirectory'
]

{ #category : 'private' }
GsUpgrader class >> _Smalltalk [

	^ self _globalNamed: 'Smalltalk'
]

{ #category : 'private' }
GsUpgrader class >> _upgradeGLASSCacheBaseDir: gsUpgraderCacheDirPath [
  ^ self _ServerFileDirectory
    on: gsUpgraderCacheDirPath , self _upgradeGLASSCacheBasePath
]

{ #category : 'private' }
GsUpgrader class >> _upgradeGLASSCacheBasePath [
  ^ '/caches/upgradeGLASS/monticello/'

]

{ #category : 'private' }
GsUpgrader class >> _upgradeGLASSCacheDir: gsUpgraderCacheDirPath [
  ^ self _ServerFileDirectory
    on:
      gsUpgraderCacheDirPath , self _upgradeGLASSCacheBasePath , '/package-cache'
]

{ #category : 'private' }
GsUpgrader class >> _upgradeGLASSCachingInto: gsUpgraderCacheDirPath forVersion: gemstoneVersion [
  "Use <cacheDirectoryPath> as the package cache for upgrade"

  | oldCache newCache cacheDir |
  cacheDir := self _upgradeGLASSCacheDir: gsUpgraderCacheDirPath.
  cacheDir assureExistence.
  oldCache := self _MCCacheRepository default.
  [ 
  newCache := self _MCCacheRepository new directory: cacheDir.
  self _MCCacheRepository setDefault: newCache.
  self new
    gsUpgraderCacheDirPath: gsUpgraderCacheDirPath;
    upgradeGLASS ]
    ensure: [ self _MCCacheRepository setDefault: oldCache ].
  self _createCacheSentinel: gsUpgraderCacheDirPath forVersion: gemstoneVersion
]

{ #category : 'private' }
GsUpgrader class >> _upgradeGLASSForGsDevKit_home: gemstoneVersion [
  | sysDefaultServer gsUpgraderCacheDirPath |
  sysDefaultServer := GsFile
    _expandEnvVariable: 'GS_SYS_DEFAULT_SERVER'
    isClient: false.
  gsUpgraderCacheDirPath := sysDefaultServer , '/gsUpgrader'.
  (self _cacheSentinelExists: gsUpgraderCacheDirPath forVersion: gemstoneVersion)
    ifTrue: [ 
      self
        _upgradeGLASSLoadingFrom: gsUpgraderCacheDirPath
        forVersion: gemstoneVersion ]
    ifFalse: [ 
      self
        _upgradeGLASSCachingInto: gsUpgraderCacheDirPath
        forVersion: gemstoneVersion ]

]

{ #category : 'private' }
GsUpgrader class >> _upgradeGLASSLoadingFrom: gsUpgraderCacheDirPath forVersion: gemstoneVersion [
  "use <repoPath> as repositoryOverrides for loads."

  | repo |
  repo := self _MCDirectoryRepository new
    directory: (self _upgradeGLASSCacheDir: gsUpgraderCacheDirPath).
  self new
    gsUpgraderCacheDirPath: gsUpgraderCacheDirPath;
    repositoryOverride: repo;
    upgradeGLASS
]

{ #category : 'batch support' }
GsUpgrader class >> batchErrorHandlingDo: aBlock [
  aBlock
    on: Error , Halt
    do: [ :ex | 
      Transcript
        cr;
        show: '========>Server Stack: ' , ex description printString;
        cr;
        show: (GsProcess stackReportToLevel: 500).
      Transcript
        cr;
        show: '========>Client Stack: ';
        cr.
      ex pass ]

]

{ #category : 'analysis' }
GsUpgrader class >> metacelloReport [
  "produce a report listing the configurations, baselines and packages loaded in the image"

  | strm |
  strm := WriteStream on: String new.
  self metacelloReportOn: strm.
  ^ strm contents

]

{ #category : 'analysis' }
GsUpgrader class >> metacelloReportOn: strm [
  "produce a report listing the configurations, baselines and packages loaded in the image"

  self new
    projectReportOn: strm;
    packageReportOn: strm

]

{ #category : 'projects' }
GsUpgrader class >> unregisterGLASS [
  "unregister GLASS, GsCore, GsMisc, GsMonticello and GsOB projects"

  self new unregisterGLASS

]

{ #category : 'projects' }
GsUpgrader class >> unregisterGLASS1 [
  "unregister GLASS and GLASS1 projects"

  self new unregisterGLASS1

]

{ #category : 'projects' }
GsUpgrader class >> upgradeGLASS [
  "Ensure that your image is upgraded to GLASS1.0-beta.9.3"

  self new upgradeGLASS

]

{ #category : 'projects' }
GsUpgrader class >> upgradeGLASS: alternateConfigurationRepositoryDirectoryPath [
  "Ensure that your image is upgraded to GLASS1.0-beta.9.3.
   Load GLASS configurations from alternateConfigurationRepositoryDirectoryPath"

  self new upgradeGLASS: alternateConfigurationRepositoryDirectoryPath

]

{ #category : 'projects' }
GsUpgrader class >> upgradeGLASS1 [
  "Ensure that your image is upgraded to the latest version of GLASS1"

  self new upgradeGLASS1

]

{ #category : 'projects' }
GsUpgrader class >> upgradeGLASSForGsDevKit_home [
  "GsDevKit_home provides directories for caching mcz files needed during upgrade"

  | gemstoneVersion |
  gemstoneVersion := System stoneVersionReport at: 'gsVersion'.
  self _upgradeGLASSForGsDevKit_home: gemstoneVersion

]

{ #category : 'projects' }
GsUpgrader class >> upgradeGrease [
  "Ensure that your image is upgraded to the latest version of Grease"

  self new upgradeGrease

]

{ #category : 'projects' }
GsUpgrader class >> upgradeGsDevKit [
  "Ensure that your image is upgraded to the latest version of GsDevKit"

  self new upgradeGsDevKit

]

{ #category : 'projects' }
GsUpgrader class >> upgradeMetacello [
  "Ensure that your image is upgraded to the latest version of Metacello"

  self new upgradeMetacello

]

{ #category : 'reporting' }
GsUpgrader >> configurationVersionReportOn: strm [
  "configuration versions"

  | count |
  count := 1.
  strm
    nextPutAll: '------------------------';
    cr;
    nextPutAll: 'Metacello Version REPORT';
    cr;
    nextPutAll: '------------------------';
    cr.
  ((Object allSubclasses
    select: [ :cl | 
      cl isMeta not
        and: [ cl isMetacelloConfig and: [ cl name asString beginsWith: 'ConfigurationOf' ] ] ])
    sort: [ :a :b | a name < b name ])
    collect: [ :each | 
      | cv |
      cv := each project currentVersion.
      cv ~~ nil
        ifTrue: [ 
          strm nextPutAll: count printString , '. '.
          strm
            nextPutAll:
                each name asString , '	' , cv versionNumber printString , '	'
                    , cv blessing printString;
            cr.
          count := count + 1 ] ]

]

{ #category : 'private' }
GsUpgrader >> deploy: aBlock [
  (self _Smalltalk at: #'GsDeployer' ifAbsent: [  ])
    ifNil: [ 
      | oldAutoCommit oldAutoMigrate |
      oldAutoCommit := self _MCPlatformSupport autoCommit.
      oldAutoMigrate := self _MCPlatformSupport autoMigrate.
      self _MCPlatformSupport autoCommit: true.
      self _MCPlatformSupport autoMigrate: true.
      [ self _MCPlatformSupport commitOnAlmostOutOfMemoryDuring: aBlock ]
        ensure: [ 
          self _MCPlatformSupport autoCommit: oldAutoCommit.
          self _MCPlatformSupport autoMigrate: oldAutoMigrate ] ]
    ifNotNil: [ :deployerClass | deployerClass deploy: aBlock ]
]

{ #category : 'testing' }
GsUpgrader >> glass1Loaded [
  ^ self standardBaselineLoaded: 'BaselineOfGLASS1'

]

{ #category : 'testing' }
GsUpgrader >> glass1Locked [
  (self metacelloClass registry
    baseline: [ :spec | spec name = 'GLASS1' ];
    list)
    do: [ :glass1Spec | 
      glass1Spec isLocked
        ifTrue: [ ^ true ] ].
  ^ false

]

{ #category : 'testing' }
GsUpgrader >> glass1Present [
  self _Smalltalk at: #'BaselineOfGLASS1' ifPresent: [ :ignored | ^ true ].
  ^ false
]

{ #category : 'private' }
GsUpgrader >> glass1RepositoryDescription [
  ^ 'github://glassdb/glass:master/repository'

]

{ #category : 'private' }
GsUpgrader >> goferBlockForUrl: aRepoUrl [
  ^ repositoryOverride
    ifNil: [ 
      [ 
      (self _Smalltalk at: #'Gofer') new
        url: aRepoUrl;
        yourself ] ]
    ifNotNil: [ 
      [ 
      (self _Smalltalk at: #'Gofer') new
        repository: repositoryOverride;
        yourself ] ]
]

{ #category : 'testing' }
GsUpgrader >> greaseBaselineLoaded [
  ^ self standardBaselineLoaded: 'BaselineOfGrease'

]

{ #category : 'testing' }
GsUpgrader >> greaseConfigurationRegistered [
  (self metacelloClass image
    configuration: [ :spec | spec name = 'Grease' ];
    list) do: [ :greaseSpec | ^ true ].
  ^ false

]

{ #category : 'testing' }
GsUpgrader >> greaseLocked [
  (self metacelloClass image
    baseline: [ :spec | spec name = 'Grease' ];
    list)
    do: [ :greaseSpec | 
      greaseSpec isLocked
        ifTrue: [ ^ true ] ].
  ^ false

]

{ #category : 'private' }
GsUpgrader >> greaseRepositoryDescription [
  ^ 'github://GsDevKit/Grease:master/repository'

]

{ #category : 'testing' }
GsUpgrader >> gsDevKitLoaded [
  ^ self standardBaselineLoaded: 'BaselineOfGsDevKit'

]

{ #category : 'testing' }
GsUpgrader >> gsDevKitLocked [
  (self metacelloClass registry
    baseline: [ :spec | spec name = 'GsDevKit' ];
    list)
    do: [ :gsDevKitSpec | 
      gsDevKitSpec isLocked
        ifTrue: [ ^ true ] ].
  ^ false

]

{ #category : 'testing' }
GsUpgrader >> gsDevKitPresent [
  self _Smalltalk at: #'BaselineOfGsDevKit' ifPresent: [ :ignored | ^ true ].
  ^ false
]

{ #category : 'private' }
GsUpgrader >> gsDevKitRepositoryDescription [
  ^ 'github://GsDevKit/GsDevKit:master/repository'

]

{ #category : 'accessing' }
GsUpgrader >> gsUpgraderCacheDirPath [
  ^ gsUpgraderCacheDirPath

]

{ #category : 'accessing' }
GsUpgrader >> gsUpgraderCacheDirPath: anObject [
  gsUpgraderCacheDirPath := anObject

]

{ #category : 'private' }
GsUpgrader >> ifNeededDownloadMetacelloPreviewFor: metacelloPreviewStableVersionString [
  | path zipUrl pid zipFileName sel |
  path := gsUpgraderCacheDirPath
    , '/caches/upgradeGLASS/metacelloPreview/metacello-work-'
    , metacelloPreviewStableVersionString.
  (self _ServerFileDirectory on: path) exists
    ifTrue: [ 
      "already downloaded"
      ^ self ].
  zipUrl := 'https://github.com/dalehenrich/metacello-work/archive/v'
    , metacelloPreviewStableVersionString , '.zip'.
  pid := (System gemVersionReport at: 'processId') printString.
  zipFileName := '/tmp/gsUpgrader-' , pid , '.zip'.
  sel := (self _MetacelloPlatform current respondsTo: #'downloadFile:to:')
    ifTrue: [ 
      "older versions of Metacello in base image of older versions of GemStone"
      #'downloadFile:to:' ]
    ifFalse: [ #'downloadBasicFile:to:' ].
  self _MetacelloPlatform current perform: sel with: zipUrl with: zipFileName.	"avoid sentButNotImplemented test errors"
  self _MetacelloPlatform current
    extractRepositoryFrom: zipFileName
    to: gsUpgraderCacheDirPath , '/caches/upgradeGLASS/metacelloPreview'
]

{ #category : 'private' }
GsUpgrader >> inform: message [
  self log: message.
  super inform: message

]

{ #category : 'loading' }
GsUpgrader >> loadGLASS1 [
  | metacello |
  self upgradeMetacello.
  metacello := self glass1Locked
    ifTrue: [ self metacelloClass registry ]
    ifFalse: [ 
      self metacelloClass new
        repository: self glass1RepositoryDescription;
        yourself ].
  metacello baseline: 'GLASS1'.
  self
    deploy: [ 
      "May be running with an old version of Metacello so copy the Metacello instance"
      self log: 'Installing GLASS1'.
      metacello copy get.
      metacello copy load ]

]

{ #category : 'loading' }
GsUpgrader >> loadGrease [
  | metacello |
  self upgradeMetacello.
  metacello := self greaseLocked
    ifTrue: [ self metacelloClass registry ]
    ifFalse: [ 
      self metacelloClass new
        repository: self greaseRepositoryDescription;
        yourself ].
  metacello baseline: 'Grease'.
  self
    deploy: [ 
      self log: 'Installing Grease'.
      metacello copy get.
      metacello copy load ]

]

{ #category : 'loading' }
GsUpgrader >> loadGsDevKit [
  | metacello |
  self upgradeMetacello.
  metacello := self gsDevKitLocked
    ifTrue: [ self metacelloClass registry ]
    ifFalse: [ 
      self metacelloClass new
        repository: self gsDevKitRepositoryDescription;
        yourself ].
  metacello baseline: 'GsDevKit'.
  self
    deploy: [ 
      "May be running with an old version of Metacello so copy the Metacello instance"
      self log: 'Installing GsDevKit'.
      metacello copy get.
      metacello copy load ]

]

{ #category : 'loading' }
GsUpgrader >> loadMetacelloBootstrap10beta311 [
  "load basic Metacello packages for version 1.0-beta.31.1. 
   To load GLASS 1.0-beta.8.7.1:
     - Metacello must handle symbolic versions
	  - MetacelloSkipDirtyPackageLoad needs to be defined"

  | goferBlock |
  (self projectVersion: 'ConfigurationOfMetacello') versionNumber
    > '1.0-beta.31.1' asMetacelloVersionNumber
    ifTrue: [ ^ self ].
  self log: 'Bootstrapping Metacello1.0-beta.31.1'.
  goferBlock := self
    goferBlockForUrl: 'http://seaside.gemtalksystems.com/ss/metacello'.
  goferBlock value
    version: 'Metacello-Base-DaleHenrichs.19';
    version: 'Metacello-Core-dkh.468';
    version: 'Metacello-MC-dkh.531';
    load.
  goferBlock value
    version: 'Metacello-Platform.gemstone-dkh.23';
    load

]

{ #category : 'loading' }
GsUpgrader >> loadMetacelloPreview [
  "Bootstrap Metacello Preview, using mcz files (#'previewBootstrap' symbolic version"

  self metacelloPreviewLoaded
    ifTrue: [ 
      self log: 'Metacello Preview already loaded'.
      ^ self ].
  self
    deploy: [ 
      self metacelloBootstrap10beta311Loaded
        ifFalse: [ self loadMetacelloBootstrap10beta311 ].
      self log: 'Loading Metacello Preview'.
      (self _Smalltalk at: #'Gofer') new
        url: 'http://seaside.gemtalksystems.com/ss/metacello';
        package: 'ConfigurationOfMetacello';
        load.	"load the Metacello Preview"
      ((self _Smalltalk at: #'ConfigurationOfMetacello') project
        version: #'previewBootstrap') load.
      (self _Smalltalk at: #'Metacello') new
        configuration: 'MetacelloPreview';
        version: #'stable';
        repository: self metacelloPreviewRepositoryDescription;
        load ]
]

{ #category : 'locking' }
GsUpgrader >> lockGrease [
  self greaseLocked
    ifTrue: [ ^ self ].
  self log: 'Locking Grease'.
  self
    deploy: [ 
      self greaseConfigurationRegistered
        ifTrue: [ 
          "workaround for https://github.com/dalehenrich/metacello-work/issues/352"
          self metacelloClass image
            configuration: 'Grease';
            unregister ].
      self metacelloClass new
        baseline: 'Grease';
        repository: self greaseRepositoryDescription;
        lock ]

]

{ #category : 'private' }
GsUpgrader >> log: message [
  Transcript
    cr;
    show: '======================';
    cr;
    show: '=====' , message

]

{ #category : 'private' }
GsUpgrader >> logPackageReport: message [
  | strm |
  strm := WriteStream on: String new.
  self packageReportOn: strm.
  Transcript
    cr;
    show: strm contents

]

{ #category : 'testing' }
GsUpgrader >> metacelloBootstrap10beta311Loaded [
  ^ (self projectVersion: 'ConfigurationOfMetacello') versionNumber
    > '1.0-beta.31.1' asMetacelloVersionNumber

]

{ #category : 'private' }
GsUpgrader >> metacelloClass [
  ^ self _Smalltalk at: #'Metacello'
]

{ #category : 'testing' }
GsUpgrader >> metacelloPreviewLoaded [
  ^ self standardBaselineLoaded: 'BaselineOfMetacello'

]

{ #category : 'private' }
GsUpgrader >> metacelloPreviewRepositoryDescription [
  ^ 'github://dalehenrich/metacello-work:configuration'

]

{ #category : 'reporting' }
GsUpgrader >> metacelloRegistrationReportOn: strm [
  | map |
  strm
    nextPutAll: '-----------------------------';
    cr;
    nextPutAll: 'Metacello Registration REPORT';
    cr;
    nextPutAll: '-----------------------------';
    cr.
  map := Dictionary new.
  self metacelloProjectRegistration registry projectSpecs
    do: [ :projectSpec | 
      self metacelloProjectRegistration
        registrationForProjectSpec: projectSpec
        ifAbsent: [ self error: 'registration for projectSpec: ' projectSpec name , ' not found' ]
        ifPresent: [ :registration :ignored | map at: registration baseName put: registration ] ].
  (map values sortWithBlock: [ :a :b | a baseName < b baseName ])
    do: [ :registration | 
      | isLoaded isLocked |
      isLocked := registration locked.
      isLoaded := registration loadedInImage.
      isLoaded
        ifFalse: [ strm nextPutAll: '<' ].
      isLocked
        ifTrue: [ strm nextPutAll: '|' ].
      strm nextPutAll: registration baseName.
      isLocked
        ifTrue: [ strm nextPutAll: '|' ].
      strm space.
      (registration respondsTo: #'currentVersionString')
        ifTrue: [ 
          strm
            nextPutAll:
              registration currentVersionString , ' [' , registration currentBranchName , ']' ]
        ifFalse: [ strm nextPutAll: registration projectSpec versionString ].
      isLoaded
        ifFalse: [ strm nextPutAll: '>' ].
      strm cr ]

]

{ #category : 'private' }
GsUpgrader >> metacelloRepositoryDescription [
  ^ 'github://dalehenrich/metacello-work:master/repository'

]

{ #category : 'private' }
GsUpgrader >> notify: message [
  self log: message.
  super notify: message

]

{ #category : 'reporting' }
GsUpgrader >> packageReportOn: strm [
  strm
    nextPutAll: '--------------';
    cr;
    nextPutAll: 'PACKAGE REPORT';
    cr;
    nextPutAll: '--------------';
    cr.
  (self mCWorkingCopy allManagers
    sortWithBlock: [ :a :b | a packageName < b packageName ])
    do: [ :wc | 
      strm
        nextPutAll: wc ancestry ancestorString;
        cr ]

]

{ #category : 'patching' }
GsUpgrader >> patchForGsDevKitIssue60 [
  "https://github.com/GsDevKit/GsDevKit/issues/60"

  | protocol |
  protocol := 'GsDevKit Issue60 patch'.
  self _Smalltalk
    at: #'HTTPSocket'
    ifPresent: [ :cls | 
      self log: 'Installing patchForGsDevKitIssue60: ' , cls name asString.
      cls compile: self patchForGsDevKitIssue60Source1 classified: protocol ].
  self _Smalltalk
    at: #'MCPlatformSupport'
    ifPresent: [ :cls | 
      self log: 'Installing patchForGsDevKitIssue60: ' , cls name asString , ' class'.
      cls class
        compile: self patchForGsDevKitIssue60Source2
        classified: protocol ]
]

{ #category : 'patching' }
GsUpgrader >> patchForGsDevKitIssue60Source1 [
  "https://github.com/GsDevKit/GsDevKit/issues/60"

  "HTTPSocket>>getResponseUpTo:ignoring:"

  ^ 'getResponseUpTo: markerString ignoring: ignoreString
  "Keep reading, until the marker is seen, skipping characters in ignoreString when
      comparing to the marker.  Return three parts: header, marker, beginningOfData.
     Fails if no marker in first 2000 chars."

  | buf response bytesRead tester mm skipped |
  buf _ ByteArray new: 2000.
  response _ WriteStream on: ByteArray new.
  tester _ 1.
  mm _ 1.
  skipped _ 0.
  [ 
  tester _ tester - markerString size + 1 max: 1.	"rewind a little, in case the marker crosses a read boundary"
  tester to: response position - 1 do: [ :tt | 
    (Character value: (buf at: tt)) = (markerString at: mm)
      ifFalse: [ 
        [ ignoreString includes: (markerString at: mm) ]
          whileTrue: [ 
            mm _ mm + 1.
            skipped _ skipped + 1 ] ].
    (Character value: (buf at: tt)) = (markerString at: mm)
      ifTrue: [ mm _ mm + 1 ]
      ifFalse: [ 
        mm _ 1.
        skipped _ 0 ].	"Not totally correct for markers like xx0xx"
    mm > markerString size
      ifTrue: [ 
        "got it"
        ^ Array
          with: (buf asString copyFrom: 1 to: tt + 1 - mm + skipped)
          with: markerString
          with: (buf asString copyFrom: tt + 1 to: response position - 1) ] ].
  tester _ 1 max: response position.	"OK if mm in the middle"
  response position < buf size & (self isActive | self readyForRead) ]
    whileTrue: [ 
      (self waitForReadDataUpToMs: 20000)
        ifFalse: [ self error: ''data was late'' ].
      bytesRead _ self readInto: buf startingAt: 1 for: buf size.
      response nextPutAll: (buf copyFrom: 1 to: bytesRead) ].
  ^ Array with: response contents asString with: '' with: ''	"Marker not found and connection closed"'

]

{ #category : 'patching' }
GsUpgrader >> patchForGsDevKitIssue60Source2 [
  "https://github.com/GsDevKit/GsDevKit/issues/60"

  "MCPlatformSupport class>>readStreamForUrl:user:passwd:do:"

  ^ 'readStreamForUrl: url user: user passwd: password do: aBlock
  | contents retries |
  retries := 0.
  [ retries <= 3 ]
    whileTrue: [ 
      [ 
      retries := retries + 1.
      contents := HTTPSocket
        httpGet: url
        args: nil
        user: user
        passwd: password.
      retries := 4 ]
        on: Error
        do: [ :ex | 
          retries > 3
            ifTrue: [ ex pass ].
          Transcript
            cr;
            show:
                ''Retrying '' , url printString , '' ('' , retries printString , '') ''
                    , ex description printString ] ].
  ^ contents isString
    ifTrue: [ nil ]
    ifFalse: [ aBlock value: contents ]'

]

{ #category : 'reporting' }
GsUpgrader >> projectReportOn: strm [
  "Use registraion and get configuration/baseline versions otherwise get configuration versions"

  self metacelloPreviewLoaded
    ifTrue: [ self metacelloRegistrationReportOn: strm ]
    ifFalse: [ self configurationVersionReportOn: strm ]

]

{ #category : 'private' }
GsUpgrader >> projectVersion: configurationClassName [
  ^ self metacelloPreviewLoaded
    ifTrue: [ 
      (self _MetacelloProjectRegistration
        projectSpecForClassNamed: configurationClassName
        ifAbsent: [ ^ nil ]) version asMetacelloVersionNumber ]
    ifFalse: [ (self _Smalltalk at: configurationClassName) project currentVersion ]
]

{ #category : 'private' }
GsUpgrader >> refreshGLASSConfigurations: repository [
  [ 
  (self _Smalltalk at: #'Gofer') new
    repository: repository;
    package: 'ConfigurationOfGofer';
    package: 'ConfigurationOfMetacello';
    package: 'ConfigurationOfGsCore';
    package: 'ConfigurationOfGoferProjectLoader';
    package: 'ConfigurationOfGsMonticello';
    package: 'ConfigurationOfGsOB';
    package: 'ConfigurationOfGsMisc';
    package: 'ConfigurationOfGsSqueakCommon';
    load ]
    on: Warning
    do: [ :ex | 
      self log: ex description.
      ex resume ]
]

{ #category : 'private' }
GsUpgrader >> registrationFor: className [
  self _Smalltalk
    at: className
    ifPresent: [ :ignored | 
      self _Smalltalk
        at: #'MetacelloProjectRegistration'
        ifPresent: [ :cls | 
          (cls registrationForClassNamed: className ifAbsent: [  ])
            ifNotNil: [ :registration | ^ registration ] ] ].
  ^ nil
]

{ #category : 'accessing' }
GsUpgrader >> repositoryOverride [

   ^repositoryOverride

]

{ #category : 'accessing' }
GsUpgrader >> repositoryOverride: anObject [

   repositoryOverride := anObject

]

{ #category : 'accessing' }
GsUpgrader >> repositoryOverrides [
  repositoryOverride ifNil: [ ^ nil ].
  ^ {(self repositoryOverride)}

]

{ #category : 'private' }
GsUpgrader >> standardBaselineLoaded: baselineClassName [
  self _Smalltalk
    at: baselineClassName
    ifPresent: [ :ignored | 
      self _Smalltalk
        at: #'MetacelloProjectRegistration'
        ifPresent: [ :cls | 
          (cls registrationForClassNamed: baselineClassName ifAbsent: [  ])
            ifNotNil: [ :registration | ^ registration loadedInImage ] ] ].
  ^ false
]

{ #category : 'private' }
GsUpgrader >> standardUpgrade: projectName repository: repositoryDescription [
  | specs projectSpec metacello |
  specs := self metacelloClass image
    baseline: [ :spec | spec name = projectName ];
    list.
  specs isEmpty
    ifFalse: [ projectSpec := specs first ].
  (projectSpec notNil and: [ projectSpec isLocked ])
    ifTrue: [ 
      projectSpec repositorySpecs
        detect: [ :repoSpec | repoSpec description = repositoryDescription ]
        ifNone: [ 
          self
            notify:
              projectName , ' project repository is not in standard location ('
                , self metacelloRepositoryDescription , '). The upgrade of '
                , projectName , ' may not be complete.' ].
      metacello := self metacelloClass image baseline: projectName ]
    ifFalse: [ 
      metacello := self metacelloClass new
        baseline: projectName;
        repository: repositoryDescription;
        yourself ].
  self
    deploy: [ 
      self log: 'Upgrading ' , projectName.
      metacello copy get.
      metacello copy load ]

]

{ #category : 'unregistering' }
GsUpgrader >> unregisterGLASS [
  "unregister GLASS, GsCore, GsMisc, GsMonticello and GsOB projects"

  self error: 'Do not use until public announcement'.
  #('ConfigurationOfGLASS' 'ConfigurationOfGsCore' 'ConfigurationOfGsMisc' 'ConfigurationOfGsMonticello' 'ConfigurationOfGsOB')
    do: [ :className | 
      (self registrationFor: className)
        ifNotNil: [ :registration | registration unregisterProject ] ]

]

{ #category : 'unregistering' }
GsUpgrader >> unregisterGLASS1 [
  "unregister GLASS1"

  self error: 'Do not use until public announcement'.
  self unregisterGLASS.
  #('BaselineOfGLASS1')
    do: [ :className | 
      (self registrationFor: className)
        ifNotNil: [ :registration | registration unregisterProject ] ]

]

{ #category : 'upgrading' }
GsUpgrader >> upgradeGLASS [
  ^ self upgradeGLASS: nil	"use default repository: http://seaside.gemtalksystems.com/ss/MetacelloRepository"

]

{ #category : 'upgrading' }
GsUpgrader >> upgradeGLASS: alternateConfigurationRepositoryDirectoryPathOrNil [
  "skip this step if GLASS1 is already loaded"

  | glassVersion originalVersion |
  self glass1Loaded
    ifTrue: [ 
      self inform: 'GLASS1 is loaded. Skipping GLASS upgrade.'.
      ^ self ].
  self metacelloPreviewLoaded
    ifTrue: [ 
      self inform: 'MetacelloPreview is loaded. Skipping GLASS upgrade.'.
      ^ self ].
  glassVersion := self projectVersion: 'ConfigurationOfGLASS'.
  self patchForGsDevKitIssue60.
  self log: 'Detected version ' , glassVersion printString , ' of GLASS'.
  glassVersion versionNumber < '1.0-beta.9.3' asMetacelloVersionNumber
    ifTrue: [ 
      self
        upgradeGLASS: alternateConfigurationRepositoryDirectoryPathOrNil
        from: glassVersion ]
    ifFalse: [ self log: 'GLASS already upgraded to 1.0-beta.9.3' ]

]

{ #category : 'private' }
GsUpgrader >> upgradeGLASS: alternateConfigurationRepositoryDirectoryPathOrNil from: glassVersion [
  "skip this step if GLASS1 is already loaded"

  self log: 'Upgrading GLASS to 1.0-beta.9.3'.
  self
    deploy: [ 
      | repository usingAlternate metacelloPreviewStableVersionString |
      repository := alternateConfigurationRepositoryDirectoryPathOrNil
        ifNotNil: [ 
          "Note that the alternate repository must have a copy of each of the 
           configurations listed in GsUpgrader>>refreshGLASSConfigurations:"
          usingAlternate := true.
          self
            log:
              'Using alternate repository: '
                , alternateConfigurationRepositoryDirectoryPathOrNil printString.
          self _MCDirectoryRepository new
            directory:
              (self _ServerFileDirectory on: alternateConfigurationRepositoryDirectoryPathOrNil) ]
        ifNil: [ 
          usingAlternate := false.
          repositoryOverride ~~ nil
            ifTrue: [ 
              self log: 'Using repositoryOverride: ' , repositoryOverride printString.
              repositoryOverride ]
            ifFalse: [ 
              self
                log:
                  'Using default repository: http://seaside.gemtalksystems.com/ss/MetacelloRepository'.
              self _MCHttpRepository
                location:
                  'http://seaside.gemtalksystems.com/ss/MetacelloRepository'
                user: ''
                password: '' ] ].
      (self _Smalltalk at: #'Gofer') new
        package: 'ConfigurationOfGLASS';
        repository: repository;
        load.
      glassVersion versionNumber < '1.0-beta.9.2' asMetacelloVersionNumber
        ifTrue: [ 
          self metacelloBootstrap10beta311Loaded
            ifFalse: [ self loadMetacelloBootstrap10beta311 ].
          [ 
          self refreshGLASSConfigurations: repository.
          ((self _Smalltalk at: #'ConfigurationOfMetacello') project
            version: #'previewBootstrap')
            repositoryOverrides: self repositoryOverrides;
            load.
          ((self _Smalltalk at: #'ConfigurationOfGLASS') project
            version: '1.0-beta.9.2')
            repositoryOverrides: self repositoryOverrides;
            load: #('Core' 'Monticello').
          self patchForGsDevKitIssue60.	"re-apply patch"
          ((self _Smalltalk at: #'ConfigurationOfGLASS') project
            version: '1.0-beta.9.2')
            repositoryOverrides: self repositoryOverrides;
            load ]
            on: (self _Smalltalk at: #'MetacelloSkipDirtyPackageLoad')
            do: [ :ex | ex resume: false ] ]
        ifFalse: [ 
          "explicitly load Metacello #previewBootstrap"
          usingAlternate
            ifTrue: [ 
              "refresh only needed if using alternate repo"
              self refreshGLASSConfigurations: repository ].
          (self
            goferBlockForUrl: 'http://seaside.gemtalksystems.com/ss/metacello')
            value
            package: 'ConfigurationOfMetacello';
            load.
          ((self _Smalltalk at: #'ConfigurationOfMetacello') project
            version: #'previewBootstrap')
            repositoryOverrides: self repositoryOverrides;
            load ].
      self upgradeGofer.
      (self goferBlockForUrl: 'http://seaside.gemtalksystems.com/ss/metacello')
        value
        package: 'ConfigurationOfMetacelloPreview';
        load.	" explicitly load ConfigurationOfMetacelloPreview"
      metacelloPreviewStableVersionString := ((self _Smalltalk
        at: #'ConfigurationOfMetacelloPreview') project version: #'stable')
        versionString.
      repositoryOverride
        ifNil: [ 
          ((self _Smalltalk at: #'ConfigurationOfGLASS') project version: '1.0-beta.9.3') load.
          gsUpgraderCacheDirPath
            ifNotNil: [ self ifNeededDownloadMetacelloPreviewFor: metacelloPreviewStableVersionString ] ]
        ifNotNil: [ 
          "Load MetacelloPreview separately -- repositoryOverrides does not apply to Metacello Preview"
          ((self _Smalltalk at: #'ConfigurationOfGLASS') project
            version: '1.0-beta.9.3')
            repositoryOverrides: self repositoryOverrides;
            load:
                #('Core' 'Monticello' 'Metacello' 'Gofer' 'Release Support' 'OB' 'Metacello Tools' 'Gofer Project Loader').
          gsUpgraderCacheDirPath
            ifNil: [ 
              ((self _Smalltalk at: #'ConfigurationOfMetacelloPreview') project version: #'stable')
                load ]
            ifNotNil: [ 
              self ifNeededDownloadMetacelloPreviewFor: metacelloPreviewStableVersionString.
              (self _Smalltalk at: #'Metacello') new
                baseline: 'Metacello';
                repository:
                    'filetree://' , gsUpgraderCacheDirPath
                        ,
                          '/caches/upgradeGLASS/metacelloPreview/metacello-work-'
                        , metacelloPreviewStableVersionString , '/repository';
                load: 'batch' ] ].
      #('GsCore' 'GsMonticello' 'GsOB' 'GsMisc')
        do: [ :gsProjectName | 
          "Patch registrations with proper repository"
          self metacelloClass image
            configuration: gsProjectName;
            repository:
                'http://seaside.gemtalksystems.com/ss/MetacelloRepository';
            register ] ]
]

{ #category : 'upgrading' }
GsUpgrader >> upgradeGLASS1 [
  | metacello projectSpec |
  self glass1Loaded
    ifFalse: [ 
      self upgradeGLASS.
      self glass1Present
        ifFalse: [ 
          ^ self
            loadGLASS1;
            upgradeGrease ] ].
  self
    upgradeMetacello;
    upgradeGrease;
    standardUpgrade: 'GLASS1' repository: self glass1RepositoryDescription

]

{ #category : 'upgrading' }
GsUpgrader >> upgradeGofer [
  "https://github.com/GsDevKit/gsUpgrader/issues/10"

  "should only be called from upgradeGLASS..."

  self log: 'Upgrading Gofer to #stable'.
  [ 
  (self
    goferBlockForUrl: 'http://seaside.gemtalksystems.com/ss/MetacelloRepository')
    value
    package: 'ConfigurationOfGofer';
    load ]
    on: Warning
    do: [ :ex | 
      self log: ex description.
      ex resume ].
  ((self _Smalltalk at: #'ConfigurationOfGofer') project version: #'stable')
    repositoryOverrides: self repositoryOverrides;
    load
]

{ #category : 'upgrading' }
GsUpgrader >> upgradeGrease [
  self greaseBaselineLoaded
    ifTrue: [ 
      self
        upgradeMetacello;
        standardUpgrade: 'Grease' repository: self greaseRepositoryDescription ]
    ifFalse: [ self loadGrease ].
  self lockGrease

]

{ #category : 'upgrading' }
GsUpgrader >> upgradeGsDevKit [
  | metacello projectSpec |
  self gsDevKitLoaded
    ifFalse: [ 
      self upgradeGLASS.
      self gsDevKitPresent
        ifFalse: [ 
          ^ self
            loadGsDevKit;
            upgradeGrease ] ].
  self
    upgradeMetacello;
    upgradeGrease;
    standardUpgrade: 'GsDevKit' repository: self gsDevKitRepositoryDescription

]

{ #category : 'upgrading' }
GsUpgrader >> upgradeMetacello [
  self
    loadMetacelloPreview;
    standardUpgrade: 'Metacello'
      repository: self metacelloRepositoryDescription

]
