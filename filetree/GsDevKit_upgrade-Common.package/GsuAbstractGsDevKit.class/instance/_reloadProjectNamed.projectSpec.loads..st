application loading
_reloadProjectNamed: projectName projectSpec: projectSpecOrNilOrString loads: loads
	| specs metacello projectSpec repoDescription loadList loadListString |
	loadList := {}.
	loads ifNotNil: [ loadList := loads ].
	projectSpecOrNilOrString
		ifNil: [
			specs := (self _globalNamed: 'Metacello') image
				baseline: [ :spec | spec name = projectName ];
				list.
			specs isEmpty
				ifFalse: [ 
					projectSpec := specs first.
					loads ifNil: [
						loadList := projectSpec loads.
						loadList ifNil: [ loadList := {}] ] ] ]
		ifNotNil: [ 
			(projectSpecOrNilOrString isKindOf: CharacterCollection)
				ifTrue: [ repoDescription :=  projectSpecOrNilOrString. ]
				ifFalse: [ 
					repoDescription := projectSpecOrNilOrString repositoryDescriptions first.
					loads ifNil: [ loadList := projectSpecOrNilOrString loads ifNil: [ {} ] ] ] ].
	loadListString := ''.
	loadList isEmpty 
		ifFalse:  [ loadListString := ' loads: ', loadList printString ].

	repoDescription
		ifNotNil: [
			self bannerLog: '		Reloading Project ', projectName, ' repository: ', repoDescription printString, loadListString.
			metacello := ((self _globalNamed: 'Metacello') new) 
				baseline: projectName;
				repository: repoDescription ]
		ifNil: [ 
			projectSpec notNil
				ifTrue: [
					self bannerLog: '		Reloading Project ', projectName printString, loadListString.
					metacello := ((self _globalNamed: 'Metacello') image) 
						baseline: projectName;
						yourself ]
				ifFalse: [ self error: 'Project spec not found for ', projectName printString ] ].
	System commit. "commit so that reload failure can be debugged"
	self
		_deploy: [
		metacello copy get.
		loadList isEmpty ifFalse:  [ metacello load: loadList ].
		metacello onConflict: [ :ex :loaded :incoming | ex useIncoming ].
		metacello load ].