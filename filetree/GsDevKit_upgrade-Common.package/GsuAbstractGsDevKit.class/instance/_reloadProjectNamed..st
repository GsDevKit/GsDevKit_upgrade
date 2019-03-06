application loading
_reloadProjectNamed: projectName
	| specs projectSpec metacello repoSpec |

	specs := (self _globalNamed: 'Metacello') image
		baseline: [ :spec | spec name = projectName ];
		list.
	specs isEmpty
		ifFalse: [ projectSpec := specs first ].
	self bannerLogDash.
	self bannerLogDash.
	projectSpec notNil
		ifTrue: [ 
			self log: '		Reloading Project ', projectName printString.
			self bannerLogDash.
			repoSpec := projectSpec repositorySpecs first.
			metacello := (self _globalNamed: 'Metacello') image baseline: projectName ]
		ifFalse: [ self error: 'Project spec not found for ', projectName printString ].
	self
		_deploy: [ 
		metacello copy get.
		metacello copy load ].