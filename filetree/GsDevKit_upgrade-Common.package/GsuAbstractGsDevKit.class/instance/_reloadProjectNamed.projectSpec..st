application loading
_reloadProjectNamed: projectName projectSpec: projectSpecOrNilOrString
	| specs metacello projectSpec repoSpec repoDescription |

	projectSpecOrNilOrString
		ifNil: [
			specs := (self _globalNamed: 'Metacello') image
				baseline: [ :spec | spec name = projectName ];
				list.
			specs isEmpty
				ifFalse: [ projectSpec := specs first ] ]
		ifNotNil: [ 
			(projectSpecOrNilOrString isKindOf: CharacterCollection)
				ifTrue: [ repoDescription :=  projectSpecOrNilOrString. ]
				ifFalse: [ repoDescription := projectSpecOrNilOrString repositoryDescriptions first ] ].
	self bannerLogDash.
	self bannerLogDash.
	repoDescription
		ifNotNil: [
			metacello := ((self _globalNamed: 'Metacello') new) 
				baseline: projectName;
				repository: repoDescription ]
		ifNil: [ 
			projectSpec notNil
				ifTrue: [ 
					self log: '		Reloading Project ', projectName printString.
					self bannerLogDash.
					metacello := ((self _globalNamed: 'Metacello') image) 
						baseline: projectName;
						yourself ]
				ifFalse: [ self error: 'Project spec not found for ', projectName printString ] ].
	self
		_deploy: [ 
		metacello onConflict: [ :ex :loaded :incoming | ex useIncoming ].
		metacello copy get.
		metacello copy load ].