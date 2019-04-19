# Upgrading GLASS/GsDevKit Applications to GemStone 3.5.0
## Intro
## Installation
```
cd $GS_HOME/shared/repos
git clone https://github.com/GsDevKit/GsDevKit_upgrade.git

stoneName=upgrade_solo
version=3.5.0
GsDefKit_upgrade/scripts/install.sh $stoneName $version
```

### default upgrade script
```smalltalk
run
	UserGlobals
		at: #GsDevKit_Image_Upgrade
		put: (GsuAbstractGsDevKitUpgrade upgradeUserName: DataCurator).
	System commitTransaction
%
```
### Upgrading stone when image is not based on extent0.seaside.dbf
```
$GEMSTONE/seaside/bin/upgradeSeasideImage -s <stone-name> -P <custom-upgrade-start-script>
```

```smalltalk
run
	UserGlobals
		at: #GsDevKit_Image_Upgrade
		put: ((GsuAbstractGsDevKitUpgrade 
						upgradeUserName: 'seaside'
							upgradeSymbolDictName: #Seaside)
						bootstrapApplicationLoadSpecs: {
			{ 'Metacello' . 'github://dalehenrich/metacello-work:master/repository' } . 
			{ 'GLASS1' . 'github://glassdb/glass:master/repository' . #( 'default' 'Base' 'Announcements') } . 
			{ 'Seaside3' . 'github://SeasideSt/Seaside:master/repository' . #( 'CI') }
	} ).
	System commitTransaction
%
```

### Url for cloning project in Rowan
```
file:$ROWAN_PROJECTS_HOME/GsDevKit_upgrade/rowan/specs/GsDevKit_upgrade.ston
```
### Rowan tool API for GsDevKit_upgrade
```smalltalk
"both topaz and filetree format deployments should be created when a new version is released"

"deploy topaz filein"
	Rowan projectTools gsuDeploy deployTopazFilein.

"deploy filetree repository"
	Rowan projectTools gsuDeploy deployFiletreeRepository.
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
