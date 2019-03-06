prepare gsdevkit  image
prepareGsDevKitImage_clearMonticelloCaches

	" clear caches - those that are unneeded or create problem during initial bootstrap load"

	self log: 'Prepare gsdevkit - clear Monticello caches'.

	"MCDefinition clearInstances"
	(self _globalNamed: 'MCDefinition') _classVars at: #Instances put: nil.
	"MCMethodDefinition shutdown"
	(self _globalNamed: 'MCMethodDefinition') _classVars at: #Definitions put: nil.
	"MethodVersionHistory reset"
	self _currentUserGlobals removeKey: #MethodVersionHistory_UniqueInstance ifAbsent: [].
	"clear out PackageOrganizer default class instance variable"
	(self _globalNamed: 'PackageOrganizer') atClassInstVar: #default put: nil.
	"clear out McCacheRepository default class instance variable"
	(self _globalNamed: 'MCCacheRepository') atClassInstVar: #default put: nil.
	"wipe out the working copy registry ... will be redefined later"
	(self _globalNamed: 'MCPackageManager') atClassInstVar: #registry put: nil.
	(self _globalNamed: 'MCWorkingCopy') atClassInstVar: #registry put: nil.
	"wipe out the default MCRepositoryGroup"
	(self _globalNamed: 'MCRepositoryGroup') atClassInstVar: #default put: nil.

	System commit.

	self log: '	Monticello caches cleared (commit)'.