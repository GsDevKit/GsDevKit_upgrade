# Upgrading GLASS/GsDevKit Applications to GemStone 3.5.0
With the release of GemStone 3.5.0, the `$GEMSTONE/bin/upgradeImage` script
no longer unconditionally resets the session method data strcutures for all 
users.
The session method data structures are only reset when method recompilation is
required, i.e., crossing 3.0 or 3.3 version boundaries.

With the change in `upgradeImage`, the 
`$GEMSTONE/seaside/bin/upgradeSeasideImage` script was going to have to change,
so it seemed like a good time to make some radical changes to the script.

In recent years, some of the `upgradeSeasideImage` functionality had been 
distrbuted into the [GsDevKit_home project][1] in the form of an 
[upgradeStone][2] script. 
While greatly simplifying the upgrade process for the GsDevKit_home users, not
all GLASS/GsDevKit users have been able to move their GemStone installations
to GsDevKit_home, so splitting functionality across `upgradeSeasideImage` has
made life more difficult for non-GsDevKit_home users.

## GLASS/GLASS1/GsDevKit
## GsDevKit_upgrade
### Upgrade Challenges
#### Method recompilation - crossing the 3.0 ad 3.3 version boundaries
#### Reloading projects to pick up version-specific changes

## GsDevKit_home Installation
```
cd $GS_HOME/shared/repos
git clone https://github.com/GsDevKit/GsDevKit_upgrade.git

stoneName=upgrade_solo
version=3.5.0
GsDevKit_upgrade/scripts/install.sh $stoneName $version
```



-------------------------------
-------------------------------


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

[1]: https://github.com/GsDevKit/GsDevKit_home
[2]: https://github.com/GsDevKit/GsDevKit_home/blob/master/bin/upgradeStone
