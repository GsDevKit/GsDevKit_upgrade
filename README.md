### Rowan topaz filein creation script
```smalltalk
| 	projectSetDefinition visitor repositoryRootPath projectsHome projectRoot specUrlString projectDefinition projectSetModification |

projectsHome := FileSystem disk / '$GS_HOME/shared/repos'.
projectRoot := projectsHome / 'GsDevKit_upgradeDevKitImage'.
specUrlString :=  'file:' , projectRoot fullName, '/rowan/specs/GsDevKit_upgrade_v2.0.ston'.
projectDefinition := RwComponentProjectDefinition newForUrl: specUrlString.
projectDefinition projectHome: projectsHome.
Rowan projectTools read 
	readProjectSetForComponentProjectDefinition: projectDefinition.
projectSetDefinition := (RwProjectSetDefinition new)
	addProject: projectDefinition;
	yourself.

repositoryRootPath := projectRoot / 'topaz'.
repositoryRootPath ensureCreateDirectory.
projectSetModification := projectSetDefinition compareAgainstBase: RwProjectSetDefinition new.
visitor := RwGsModificationTopazWriterVisitor new
	repositoryRootPath: repositoryRootPath;
	topazFilename: 'GsDevKit_upgrade';
	yourself.
visitor visit: projectSetModification.
```
### Rowan project creation script
```smalltalk
"Create GsDevKit_upgradeDevKitImage project"

	| projectUrl projectName configurationNames groupNames comment projectHome
		cpd packageName |

	projectName := 'GsDevKit_upgradeDevKitImage'.
	configurationNames := #( 'Main' ).
	groupNames := #( 'core' ).
	projectUrl := 'https://github.com/GsDevKit/', projectName.
	comment := 'Support for upgrading GsDevKit images to GemStone 3.5.x and beyond'.

	projectHome := '$ROWAN_PROJECTS_HOME'.

"create project definition"
	cpd := RwComponentProjectDefinition
		projectName: projectName 
			configurationNames: configurationNames 
			groupNames: groupNames 
			useGit: true 
			projectUrl: projectUrl 
			comment: comment.

"create package definitions"
	cpd
		addPackageNamed: projectName, '-Core' 
			toComponentNamed: 'Main' 
			withConditions: #( 'common' ) 
			andGroup: 'core';
		yourself.

"create class and method definitions"
	packageName := projectName, '-Core'.

"prepare to export component project definition"
	cpd projectHome: projectHome.
	cpd repositoryRoot ensureDeleteAll.

"create component project on disk"
	cpd create.
```
