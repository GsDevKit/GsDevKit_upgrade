application loading
loadApplicationLoadSpecs

	| glass1Upgraded |
	"unload the 2.x only packages"
	(self _globalNamed: 'PackageInfo') registerPackageName: 'GemStone-Exceptions'.
	((self _globalNamed: 'MCWorkingCopy') forPackage: ((self _globalNamed: 'MCPackage') new name: 'GemStone-Exceptions')) unload.

	"start with a fresh package registry"
	(self _globalNamed: 'MCWorkingCopy') atClassInstVar: #registry put: nil.
	((self _globalNamed: 'PackageOrganizer') default instVarAt: ((self _globalNamed: 'PackageOrganizer') allInstVarNames indexOfIdentical: #'packages')) removeKey: 'Monticello-Mocks' ifAbsent: [].

	"explicitly load each of the configuration packages lised in boolStrapApplicationLoadSpecs"
	glass1Upgraded := false.
	self bootstrapApplicationLoadSpecs do: [:loadSpec |
		loadSpec size = 4
			ifTrue: [
				"ConfigurationOf load spec"
				| path |
				path := (loadSpec at: 4) ifNil: [ self bootstrapRepositoryDirectory ].
				(self _globalNamed: 'Gofer') new 
					directory: ((self _globalNamed: 'ServerFileDirectory') on: path);
					package: 'ConfigurationOf', (loadSpec at: 1);
					load ] ].
	System commit.

	"Now load the entire configuration to pick up user application code and to ensure
		that the in-memory package state is correct"

	self bootstrapApplicationLoadSpecs do: [:loadSpec | 
		loadSpec size = 1
			ifTrue: [ self _reloadProjectNamed: (loadSpec at: 1) projectSpec: nil loads: nil ]
			ifFalse: [
				loadSpec size = 2
					ifTrue: [ self _reloadProjectNamed: (loadSpec at: 1) projectSpec: (loadSpec at: 2) loads: nil ]
					ifFalse: [ 
						loadSpec size = 3
							ifTrue: [ self _reloadProjectNamed: (loadSpec at: 1) projectSpec: (loadSpec at: 2) loads: (loadSpec at: 2) ]
							ifFalse: [ 
								[
								| repoPath configurationClassName versionString loadList |
								configurationClassName := 'ConfigurationOf', (loadSpec at: 1).
								versionString := loadSpec at: 2.
								loadList := loadSpec at: 3.
								repoPath := (loadSpec at: 4) ifNil: [ self bootstrapRepositoryDirectory ].
								self log: '		', configurationClassName printString, ' version ', versionString printString , ' loads: ', loadList printString, ' from: ', repoPath printString.
								(self _globalNamed: 'GsDeployer') bulkMigrate: [ 
									| projectName |
									projectName := loadSpec at: 1.
									(self _globalNamed: 'Metacello') new
										configuration: projectName;
										version: versionString;
										repositoryOverrides: { 'server://', repoPath };
										onConflict: [ :ex :loaded :incoming | ex useIncoming ];
										load: loadList ] ]
											on: (self _globalNamed: 'MCPerformPostloadNotification')
											do: [:ex |
												(self bootstrapPostLoadClassList includes: ex postloadClass theNonMetaClass name)
													ifTrue: [ 
														self log: '			Skip ', ex postloadClass name asString, ' initialization.'.
														ex resume: false ]
													ifFalse: [ 
														self log: '			Perform ', ex postloadClass name asString, ' initialization.'.
														ex resume: true ] ] ] ] ] ].
	self bannerLogDash.
	self bannerLogDash.

	System commit.