bootstrapping
upgradeGlass1

	"use GsUpgrader to install GLASS1 "

	self timeStampedLog: '	install GLASS1'.

	self bootstrapGlass.

	"install GsUpgrader"
	self log: '	installGsUpgrader'.
	(self _globalNamed: 'Gofer') new 
		url: 'http://ss3.gemtalksystems.com/ss/gsUpgrader';
		package: 'GsUpgrader-Core';
		load.

	self log: '	upgrade to GLASS'.
	(self _globalNamed: 'GsUpgrader') upgradeGLASS.
true ifTrue: [ 
		"workaround for https://github.com/Metacello/metacello/issues/254, which is re-appearing again"
		"
			Metacello Issue 254 workaround
				unregistering (configuration): Gofer
				unregistering (configuration): FileTree
				unregistering (configuration): Metacello
				unregistering (configuration): Gofer Project Loader
				unregistering (configuration): Grease
				unregistering (configuration): SqueakCommon
		"
		| registry |
		self log: '	Metacello Issue 254 workaround'.
		registry := (self _globalNamed: 'MetacelloProjectRegistration') registry.
		registry configurationProjectSpecs copy do: [:projectSpec |
			projectSpec isConfigurationOfProjectSpec ifFalse: [ self log: '		unregistering (configuration): ' , projectSpec name. projectSpec unregisterProject ] ].
		registry baselineProjectSpecs copy do: [:projectSpec | 
			projectSpec isBaselineOfProjectSpec ifFalse: [ self log: '		unregistering (baseline): ' , projectSpec name. projectSpec unregisterProject ]].
		{ 
			{'FileTree' . 'github://dalehenrich/filetree:gemstone2.4/repository' } .
			{'Metacello' . 'github://dalehenrich/metacello-work:master/repository' } .
			{'Grease' . 'github://GsDevKit/Grease:master/repository' } .
		} do: [:ar |
			(self _globalNamed: 'Metacello') new
				baseline: (ar at: 1);
				repository: (ar at: 2);
				lock ].
		{ 
			{'Gofer' .  'http://seaside.gemtalksystems.com/ss/metacello'} .
		} do: [:ar |
			(self _globalNamed: 'Metacello') new
				configuration: (ar at: 1);
				repository: (ar at: 2);
				lock ].
 ].
false ifTrue:  [
	self log: '	upgrade to GLASS1'.
	(self _globalNamed: 'GsUpgrader') upgradeGLASS1 ].

	self bannerLogDash.
	self bannerLogDash.

	self log: '	... done install GLASS1'.