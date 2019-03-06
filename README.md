### Url for cloning project in Rowan
```
file:$ROWAN_PROJECTS_HOME/GsDevKit_upgrade/rowan/specs/GsDevKit_upgrade.ston
```
### Rowan tool API for GsDevKit_upgrade
```smalltalk
"deploy topaz filein"
	Rowan projectTools gsuDeploy deployTopazFilein

"deploy filetree filein"
	Rowan projectTools gsuDeploy deployFiletreeFilein
```
### Rowan project creation script
```smalltalk
"Create GsDevKit_upgrade project"

	| projectUrl projectName configurationNames groupNames comment projectHome
		cpd packageName |

	projectName := 'GsDevKit_upgrade'.
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
