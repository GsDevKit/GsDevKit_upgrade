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


## The GLASS/GLASS1/tODE/GsDevKit Story
There are currently 4 different environments for open source development in 
GemStone/S:
1. [GLASS](#glass) - The original environment for running [Seaside][17] on GemStone.
2. [GLASS1](#glass1) - The core of GemTalk System's [Open Source Development Kit][18].
3. [tODE](#tODE) - The primary development environment for GemTalk System's [Open Source Development Kit][18].
4. [GsDevKit](#gsdevkit) - The eventual successor to **GLASS1**.

I believe that there are developers using each of these environments and 
therefore need to be considered when it comes to upgrading.

The following sections provide a bit of information about each of the 
environments before we get serious about taling upgrade.

### GLASS
With every release of GemStone/S 64, GemTalk Systems ships an `extent0.dbf`
file and an `extent0.seaside.dbf` file.
`extent0.dbf`is an extent file with the standard GemStone class library
installed.
`extent0.seaside.dbf` is an extent file with the standard GemStone/S class
library installed as well as **ConfigurationOfGLASS** version 1.0-beta.9.\*.

For the puposes of this document an extent with just the 
**ConfigurationOfGLASS** installed will be called **GLASS**.

**GLASS** uses **Monticello** packages and repositories (i.e., [GemSource][3],
[SS3][4], and [SqueakSource][5]).
**GLASS** does not include support for **[Metacello][6]** nor
**[FileTree][7]**.

Every version of GemStone/S 64 since [2.4.4][8] (released in 2010) includes
basically the same version of **GLASS**.
This level of compatibility between between GemStone 2.4.4 and GemStone 3.5.0
and all the versions in between means that there is a an upgrade path for your
application from one version of GemStone to another. 

### GLASS1
**GLASS1** dates back to 2012, when the first work began using
**[Metacello][6]**, **[FileTree][7]** and git-based repositories for managing
Smalltalk source code.

GLASS1.0-beta.9.1 was the first common version between 
**[ConfigurationOfGLASS-dkh.224.mcz][10]** managed on GemSource][10] and 
**[BaselineOfGLASS1][9]** managed on [GitHub][11].

GLASS1 is supported (read tested) for GemStone versions 2.4.8 through 3.4.3
(currently the lastest released version of GemStone/S).

GLASS1 follows the principle of continuous delivery where every release to the
`master` branch can be safely used in production.
There are no API breaking changes commited to the `master` branch and the
changes are tested against all supported releases.

### tODE
[**tODE**][15] dates back to 2012, when I began work on a development environment that
supported development using **Metacello**, **FileTree**, and git.
**tODE** is built on top **GLASS1**.
**tODE** is integrated with **GsDevKit_home** 

### GsDevKit
**GsDevKit** dates back to 2014, when it was decided to rebrand GLASS1 as 
GsDevKit.
The [GsDevKit organization][13] was created and the [GsDevKit project][12] was
created as a fork of the [glass project][11].
There is no real difference between the code in **GsDevKit** and **GLASS1** other 
than the name of the *BaselineOf*.

The mechanics of converting a **GLASS1** project to **GsDevKit** has kept me 
from pushing for developers to do the conversion.
Perhaps when [Rowan][14] is released the conversion from **GLASS1** to 
**GsDevKit** will be practical.

## Upgrade scenarios
There are now three different upgrade scenarios:
1. [Upgrades requiring method recompilation](#upgrades-requiring-method-recompilation).
2. [Upgrades where session method structure is reset](#upgrades-where-session-method-structure-is-reset)
3. [Upgrades requiring project reloads](#upgrades-requiring-project-reloads)
#### Upgrades requiring method recompilation
This upgrade scenario is triggered when a db is upgraded to a version of
GemStone where the shape of the GsNMethod class has changed (3.0 and 3.3 version boundaries)
In this scenario, an error will occur if an attempt is made to invoke a method
that has not been recompiled to the new class format.

To upgrade using a **Monticello**-based package system, it is necessary to *bootstrap* the **Monticello** loading code 
#### Upgrades where session method structure is reset
#### Upgrades requiring project reloads


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
[3]: http://seaside.gemtalksystems.com/ss/
[4]: http://ss3.gemtalksystems.com/
[5]: http://www.squeaksource.com/
[6]: https://github.com/Metacello/metacello
[7]: https://github.com/dalehenrich/filetree
[8]: https://gemtalksystems.com/products/gs64/versions24x/
[9]: https://github.com/glassdb/glass/tree/044b42d4601d5ca3789ade45c7a3e6bcdca9c7f9/repository
[10]: http://seaside.gemtalksystems.com/ss/MetacelloRepository.html
[11]: https://github.com/glassdb/glass
[12]: https://github.com/GsDevKit/GsDevKit
[13]: https://github.com/GsDevKit
[14]: https://github.com/GemTalk/Rowan
[15]: https://github.com/dalehenrich/tode
[16]: https://www.youtube.com/watch?feature=player_embedded&v=FGkdXwGtfd8
[17]: https://github.com/SeasideSt/Seaside
[18]: https://gemtalksystems.com/small-business/gsdevkit/
