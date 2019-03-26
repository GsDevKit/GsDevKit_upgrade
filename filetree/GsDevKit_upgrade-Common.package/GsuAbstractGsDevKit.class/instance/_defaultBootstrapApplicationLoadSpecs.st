private
_defaultBootstrapApplicationLoadSpecs
	"formerly BootstrapApplicationLoadSpecs, bootstrap GLASS configuration name, version, load spec and directory path"

	self _todeLoaded
		ifTrue: [
			self log: '	load BaselineOfMetacello and BaselineOfTode (default)'.
			"first update Metacello and then update Tode"
			^	{
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
			self log: '	load BaselineOfMetacello and BaselineOfGLASS1 (default)'.
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
			self log: '	load BaselineOfMetacello and BaselineOfGsDevKit (default)'.
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
	self log: '	load ConfigurationOfGLASS'.
	^{}