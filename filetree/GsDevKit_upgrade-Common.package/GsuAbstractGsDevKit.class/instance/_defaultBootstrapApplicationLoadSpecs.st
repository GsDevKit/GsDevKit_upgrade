private
_defaultBootstrapApplicationLoadSpecs
	"formerly BootstrapApplicationLoadSpecs, bootstrap GLASS configuration name, version, load spec and directory path"

	self _todeLoaded
		ifTrue: [
			self timeStampedLog: '	load BaselineOfMetacello and BaselineOfTode (default)'.
			"first update Metacello and then update Tode and reload GLASS1 after updating Tode. 
				in 3.7.0, OB-Tools package changed and Tode only loades Base group of GLASS1,
				so it is prudent to reload GLASS1 to ensure that we pick up the full set of classes
				needed for new version."
			^	{
				{
					'Metacello'. 
					self _projectSpecForBaseline: 'BaselineOfMetacello'.
				}.
				{
					'Tode'. 
					self _projectSpecForBaseline: 'BaselineOfTode'.
				}.
				{
					'GLASS1'. 
					self _projectSpecForBaseline: 'BaselineOfGLASS1'.
				}.
			} ].
	self _glass1Loaded
		ifTrue: [
			self timeStampedLog: '	load BaselineOfMetacello and BaselineOfGLASS1 (default)'.
			"first update Metacello and then update GLASS1"
			^	{
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
			self timeStampedLog: '	load BaselineOfMetacello and BaselineOfGsDevKit (default)'.
			^	{	"assume that GsDevKit needs to be reloaded"
				{
					'Metacello'. 
					self _projectSpecForBaseline: 'BaselineOfMetacello'.
				}.
				 {
					'GsDevKit'. 
					self _projectSpecForBaseline: 'BaselineOfGsDevKit'.
				}.
			} ].
	self timeStampedLog: '	load ConfigurationOfGLASS'.
	^{}