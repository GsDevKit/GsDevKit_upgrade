private
_defaultBootstrapApplicationLoadSpecs
	"formerly BootstrapApplicationLoadSpecs, bootstrap GLASS configuration name, version, load spec and directory path"

	self _todeLoaded
		ifTrue: [
			self log: '	load BaselineOfMetacello BaselineOfTode'.
			"first update Metacello and then update Tode"
			^ self _configurationOfGLASS_bootstrap, {
				{
					'Metacello'. 
					self _projectSpecForBaseline: 'BaselineOfMetacello'.
				}.
				{
					'Tode'. 
					self _projectSpecForBaseline: 'BaselineOfTode'.
				}.
			} ].
	self _glass1Loaded
		ifTrue: [
			self log: '	load BaselineOfMetacello BaselineOfGLASS1'.
			"first update Metacello and then update GLASS1"
			^ self _configurationOfGLASS_bootstrap, {
				{
					'Metacello'. 
					self _projectSpecForBaseline: 'BaselineOfMetacello'.
				}.
				{
					'GLASS1'. 
					self _projectSpecForBaseline: 'BaselineOfGLASS1'.
				}.
			} ].
	self _gsDevKitLoaded
		ifTrue: [
			self log: '	load BaselineOfGsDevKit'.
			^ self _configurationOfGLASS_bootstrap, {	"assume that GsDevKit needs to be reloaded"
				{
					'Metacello'. 
					self _projectSpecForBaseline: 'BaselineOfMetacello'.
				}.
				 {
					'GsDevKit'. 
					self _projectSpecForBaseline: 'BaselineOfGsDevKit'.
				}.
			} ].
	self log: '	load ConfigurationOfGLASS'.
	^{	"assume that GLASS needs to be reloaded"
		 {
				'ConfigurationOfGLASS'. 
				'1.0-beta.9.2.2'. 
				#('default'). 
				nil.	"nill - use bootstrapRepositoryDirectory"
		}.
	}