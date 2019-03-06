Class {
	#name : 'GsuGsDevKit_3_5_0_StdUpgrade',
	#superclass : 'GsuGsDevKit_3_5_0_Upgrade',
	#category : 'GsDevKit_upgradeDevKitImage-Core'
}

{ #category : 'private' }
GsuGsDevKit_3_5_0_StdUpgrade >> _clearMetacelloCaches [

	"Metacello caches used in calculating default values for application load specs, so cache
		application load specs before clearing the Metacello cache"

	self _glass1Loaded
		ifFalse: [ 
			"GLASS needs to have the caches cleared, since stale repository entries can cause trouble"
			self bootstrapApplicationLoadSpecs.
			super _clearMetacelloCaches ].
]

{ #category : 'private' }
GsuGsDevKit_3_5_0_StdUpgrade >> _listUpgradeParameters [

	^ #( )
]

{ #category : 'private' }
GsuGsDevKit_3_5_0_StdUpgrade >> _singletonUpgradeParameters [

	^ #( upgradeUserName upgradeSymbolDictName )
]

{ #category : 'accessing' }
GsuGsDevKit_3_5_0_StdUpgrade >> buildString [

	" 
		Standard -	method recompilation not required
		Bootstrap -	method recompilation required 
	"

	^ 'Standard'
]

{ #category : 'prepare gsdevkit  image' }
GsuGsDevKit_3_5_0_StdUpgrade >> prepareGsDevKitImage_bootstrapGsDevkit [

	"install GsdevKit from scratch"

	"noop for standard upgrade"
]

{ #category : 'prepare gsdevkit  image' }
GsuGsDevKit_3_5_0_StdUpgrade >> prepareGsDevKitImage_bug46217_patch [

	"Bug 46217 - during bootstrap don''t remove any classes.
		during initial bootstrap no classes will be removed
		during upgrade unexpected classes should not be removed during the
		bootstrap operation"

	"noop for standard upgrade"
]

{ #category : 'prepare gsdevkit  image' }
GsuGsDevKit_3_5_0_StdUpgrade >> prepareGsDevKitImage_patch_compileMethodCategory [
	"patch only needed suring standard upgrade ..."

	"will be overridden when Core package loaded"

	self log: '		Patching ...Behavior>>compileMethod:category:'.

	(Behavior
		compileMethod: self _prepareImage_behavior_compileMethod_Category_patchSource 
		dictionaries: self upgradeUserProfile symbolList 
		category: '*core-squeak') ifNotNil: [:ar | self error: 'did not compile' ].
]

{ #category : 'prepare gsdevkit  image' }
GsuGsDevKit_3_5_0_StdUpgrade >> prepareGsDevKitImage_recompilePragmaMethods [

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
GsuGsDevKit_3_5_0_StdUpgrade >> prepareGsDevKitImage_removeAllMethods [

	"remove all methods in GsDevKit user classes"

	"noop for standard upgrade"
]

{ #category : 'prepare gsdevkit  image' }
GsuGsDevKit_3_5_0_StdUpgrade >> prepareGsDevKitImage_resetExistingGlobalState [

	"Reset and/or initialize any classes that may have invalid state carried over"

	self log: 'Prepare gsdevkit - reset existing global state'.

	(self _globalNamed: 'MCMockPackageInfo') initialize
]

{ #category : 'prepare image user' }
GsuGsDevKit_3_5_0_StdUpgrade >> prepareImage_user_clear_subscriptions [
	"no need to clear subscriptions during standard upgrade, because class initialization 
		methods will not be fired."

	self log: '	SystemLoginNotification Subscriptions NOT cleared'.
]

{ #category : 'initialization' }
GsuGsDevKit_3_5_0_StdUpgrade >> resolveForUpgrade [
	"Receiver is already resolved"

	self objectSecurityPolicy: self upgradeUserProfile defaultObjectSecurityPolicy
]
