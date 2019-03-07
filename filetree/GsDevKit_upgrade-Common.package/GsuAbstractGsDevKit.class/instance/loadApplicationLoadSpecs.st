application loading
loadApplicationLoadSpecs

	| glass1Upgraded |
	self log: '	loading bootstrap application load specs'.

	"unload the 2.x only packages"
	(self _globalNamed: 'PackageInfo') registerPackageName: 'GemStone-Exceptions'.
	((self _globalNamed: 'MCWorkingCopy') forPackage: ((self _globalNamed: 'MCPackage') new name: 'GemStone-Exceptions')) unload.

	"start with a fresh package registry"
	(self _globalNamed: 'MCWorkingCopy') atClassInstVar: #registry put: nil.
	((self _globalNamed: 'PackageOrganizer') default instVarAt: ((self _globalNamed: 'PackageOrganizer') allInstVarNames indexOfIdentical: #'packages')) removeKey: 'Monticello-Mocks' ifAbsent: [].

	"explicitly load each of the configuration packages lised in boolStrapApplicationLoadSpecs"
	glass1Upgraded := false.
	self bootstrapApplicationLoadSpecs do: [:loadSpec |
		loadSpec size = 1
			ifFalse: [
				| path |
				path := (loadSpec at: 4) ifNil: [ self bootstrapRepositoryDirectory ].
				(self _globalNamed: 'Gofer') new 
					directory: ((self _globalNamed: 'ServerFileDirectory') on: path);
					package: (loadSpec at: 1);
					load ] ].
	System commit.

	"Now load the entire configuration to pick up user application code and to ensure
		that the in-memory package state is correct"

	self bootstrapApplicationLoadSpecs do: [:loadSpec | 
		loadSpec size = 1
			ifTrue: [ self _reloadProjectNamed: (loadSpec at: 1) ]
			ifFalse: [
				[
				| repoPath configurationClassName versionString loadList |
				configurationClassName := loadSpec at: 1.
				versionString := loadSpec at: 2.
				loadList := loadSpec at: 3.
				repoPath := (loadSpec at: 4) ifNil: [ self bootstrapRepositoryDirectory ].
				self log: '		', configurationClassName printString, ' version ', versionString printString , ' loads: ', loadList printString, ' from: ', repoPath printString.
				(self _globalNamed: 'GsDeployer') bulkMigrate: [ 
					| projectName |
					projectName := (self _globalNamed: 'MetacelloScriptEngine') configurationProjectNameOf: configurationClassName asString.
					(self _globalNamed: 'Metacello') new
						configuration: projectName;
						version: versionString;
						repositoryOverrides: { 'server://', repoPath };
						load: loadList ] ]
							on: (self _globalNamed: 'MCPerformPostloadNotification')
							do: [:ex |
								(self bootstrapPostLoadClassList includes: ex postloadClass theNonMetaClass name)
									ifTrue: [ 
										self log: '			Skip ', ex postloadClass name asString, ' initialization.'.
										ex resume: false ]
									ifFalse: [ 
										self log: '			Perform ', ex postloadClass name asString, ' initialization.'.
										ex resume: true ] ] ] ].
	self bannerLogDash.
	self bannerLogDash.

	System commit.

	self log: '	done (commit)'.