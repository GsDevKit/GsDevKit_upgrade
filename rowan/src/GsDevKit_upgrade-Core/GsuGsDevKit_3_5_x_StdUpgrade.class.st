Class {
	#name : 'GsuGsDevKit_3_5_x_StdUpgrade',
	#superclass : 'GsuGsDevKit_3_5_x_Upgrade',
	#category : 'GsDevKit_upgrade-Core'
}

{ #category : 'private' }
GsuGsDevKit_3_5_x_StdUpgrade >> _defaultExistingConfigurationOfNames [
	" These two configurations are the only configurations that must be removed, before loading GLASS1 or GsDevKit or tODE"

	| default |
	default := { #ConfigurationOfGsMisc . #ConfigurationOfGsCore }.
	self _glassLoaded 
		ifTrue: [ 
			"if we are loading GLASS, the ConfigurationOfGLASS needs to be reloaded as well"
			default 
				add: #ConfigurationOfGLASS;
				add: #ConfigurationOfGsMonticello ].
	^ default
]

{ #category : 'private' }
GsuGsDevKit_3_5_x_StdUpgrade >> _listUpgradeParameters [

	^ #( )
]

{ #category : 'private' }
GsuGsDevKit_3_5_x_StdUpgrade >> _prepareGsDevKitImage_validate_session_methods [
	"return list of session methos that need recompilation"

	"noop"

	^ {}
]

{ #category : 'private' }
GsuGsDevKit_3_5_x_StdUpgrade >> _prepareGsDevKitImage_validate_user_methods [
	"return list of methos in upgrade symbol dictionary that need recompilation"

	"noop"

	^ {}
]

{ #category : 'private' }
GsuGsDevKit_3_5_x_StdUpgrade >> _projectSpecForBaseline: baselineClassName [
	"Have to extract project spec from regsitry without sending messages, because methods may need to be recompiled"

	"should only apply when doing bootstrap loads"

	^ nil	"project spec will be calculated at load time"
]

{ #category : 'private' }
GsuGsDevKit_3_5_x_StdUpgrade >> _singletonUpgradeParameters [

	^ #( upgradeUserName upgradeSymbolDictName )
]

{ #category : 'private' }
GsuGsDevKit_3_5_x_StdUpgrade >> _standardBaselineLoaded: baselineClassName [
	"message-based implmentation since methods do not need recompilation"

	(self _globalNamed: baselineClassName)
		ifNotNil: [ 
			(self _globalNamed: 'MetacelloProjectRegistration')
				ifNotNil: [ :cls | 
					(cls registrationForClassNamed: baselineClassName ifAbsent: [ ])
						ifNotNil: [ :registration | ^ registration loadedInImage ] ] ].
	^ false
]

{ #category : 'accessing' }
GsuGsDevKit_3_5_x_StdUpgrade >> buildString [

	" 
		Standard -	method recompilation not required
		Bootstrap -	method recompilation required 
	"

	^ 'Standard'
]

{ #category : 'prepare gsdevkit  image' }
GsuGsDevKit_3_5_x_StdUpgrade >> prepareGsDevKitImage_bootstrapGsDevkit [

	"install GsdevKit from scratch"

	self _resetMonticelloPackageRegistry
]

{ #category : 'prepare gsdevkit  image' }
GsuGsDevKit_3_5_x_StdUpgrade >> prepareGsDevKitImage_bug46217_patch [

	"Bug 46217 - during bootstrap don''t remove any classes.
		during initial bootstrap no classes will be removed
		during upgrade unexpected classes should not be removed during the
		bootstrap operation"

	"noop for standard upgrade"
]

{ #category : 'prepare gsdevkit  image' }
GsuGsDevKit_3_5_x_StdUpgrade >> prepareGsDevKitImage_clearMetacelloCaches [

	"GLASS needs to have the caches cleared, since stale repository entries can cause trouble during reload"

	self _glassLoaded
		ifTrue: [ 
			^ super prepareGsDevKitImage_clearMetacelloCaches ].
	"caches are used for reloading BaselineOf"
	self log: 'Prepare gsdevkit - Metacello caches NOT cleared'.
]

{ #category : 'prepare gsdevkit  image' }
GsuGsDevKit_3_5_x_StdUpgrade >> prepareGsDevKitImage_loadApplicationCode [
	"explicitly load each of the configuration packages lised in boolStrapApplicationLoadSpecs"

	"load application code"

	self log: 'Prepare gsdevkit - load GsDevKit application code'.

	"force configurations to be reloaded if needed"
	self removeExistingConfigurations.

	"now load application"

	self loadApplicationLoadSpecs.

	self log: '		load GsDevKit application code DONE (commit)'.
]

{ #category : 'prepare gsdevkit  image' }
GsuGsDevKit_3_5_x_StdUpgrade >> prepareGsDevKitImage_patch_compileMethodCategory [
	"patch only needed suring standard upgrade ..."

	"will be overridden when Core package loaded"

	self log: '		Patching ...Behavior>>compileMethod:category:'.

	(Behavior
		compileMethod: self _prepareImage_behavior_compileMethod_Category_patchSource 
		dictionaries: self upgradeUserProfile symbolList 
		category: '*core-squeak') ifNotNil: [:ar | self error: 'did not compile' ].
]

{ #category : 'prepare gsdevkit  image' }
GsuGsDevKit_3_5_x_StdUpgrade >> prepareGsDevKitImage_recompilePragmaMethods [

	"Methods that references the ObsoletePragma class (pre-3.4) need to be recompiled."

	"Methods with pragmas need to be recompiled so that they reference the new Pragma class"

	| recompileBlock |
	self log: 'Prepare gsdevkit - recompile pragma methods'.
	recompileBlock := [:meth |
		| cls categ src |
		cls := meth inClass.
		src := meth sourceString.
		categ := cls categoryOfSelector: meth selector.
		cls
			_checkCompileResult:
				(cls
					compileMethod: src 
					dictionaries: System myUserProfile symbolList 
					category: categ 
					environmentId: 0)
			source: src ].
	self log: '	recompiling method referencing ObsoletePragma...'.
	self log: '		ObsoletePragma ', (ObsoleteClasses at: #ObsoletePragma) asOop printString.
	self log: '		System myUserProfile: ', System myUserProfile userId.
	((ClassOrganizer newWithRoot: Object forUserId: self upgradeUserName) referencesToObject: (ObsoleteClasses at: #ObsoletePragma))
		do: [:method |
			self log: '		', method inClass asString, (method inClass isMeta ifTrue: [' class'] ifFalse: ['']), '>>', method selector printString.
			recompileBlock value: method ].
	self log: '	recompiling methods with pragmas...'.
	self methodsWithPragmas
		do: [:method |
			GsFile gciLogServer: '		', method inClass asString, (method inClass isMeta ifTrue: [' class'] ifFalse: ['']), '>>', method selector printString.
			recompileBlock value: method ].	
	System commit.
	self log: '	done recompiling (commit)'.
]

{ #category : 'prepare gsdevkit  image' }
GsuGsDevKit_3_5_x_StdUpgrade >> prepareGsDevKitImage_removeAllMethods [

	"remove all methods in GsDevKit user classes"

	"noop for standard upgrade"
]

{ #category : 'prepare gsdevkit  image' }
GsuGsDevKit_3_5_x_StdUpgrade >> prepareGsDevKitImage_resetExistingGlobalState [

	"Reset and/or initialize any classes that may have invalid state carried over"

	self log: 'Prepare gsdevkit - reset existing global state'.

	(self _globalNamed: 'MCMockPackageInfo') initialize
]

{ #category : 'prepare image user' }
GsuGsDevKit_3_5_x_StdUpgrade >> prepareImage_user_clear_subscriptions [
	"no need to clear subscriptions during standard upgrade, because class initialization 
		methods will not be fired."

	self log: '	SystemLoginNotification Subscriptions NOT cleared'.
]

{ #category : 'prepare image user' }
GsuGsDevKit_3_5_x_StdUpgrade >> prepareImage_user_removeSessionMethods [
	"Remove all session methods as they must be recompiled during loading ... must be done before GsPackagePolicy is enabled"

	"noop"
]

{ #category : 'initialization' }
GsuGsDevKit_3_5_x_StdUpgrade >> resolveForUpgrade [
	"Receiver is already resolved"

	self objectSecurityPolicy: self upgradeUserProfile defaultObjectSecurityPolicy
]
