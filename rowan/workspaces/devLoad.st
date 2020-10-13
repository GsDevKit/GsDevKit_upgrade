"Workspace used to load the GsDevKit_upgrade project into GemStone (with Rowan
	already installed) using tonel format packages"
| projectParentPath |
projectParentPath := System gemEnvironmentVariable: 'ROWAN_PROJECTS_HOME'.
(Rowan
	projectFromUrl: 'file://', projectParentPath, 'GsDevKit_upgrade/rowan/specs/GsDevKit_upgrade_dev.ston'
	gitUrl: 'file://', projectParentPath, '/GsDevKit_upgrade') load
