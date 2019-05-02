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

1. [BACKGROUND: The GLASS/GLASS1/tODE/GsDevKit Story](#background-the-glassglass1todegsdevkit-story)
2. [`upgradeSeasideImage` 101](#upgradeseasideimage-101)
3. [`upgradeSeasideImage` man page](#upgradeseasideimage-man-page]
3. [Customizing GsDevKit_upgrade](#customizing-gsdevkit_upgrade)

## BACKGROUND: The GLASS/GLASS1/tODE/GsDevKit Story
There are currently 4 different code environments for open source development
in GemStone/S:
1. [GLASS](#glass) - The original environment for running [Seaside][17] on GemStone.
2. [GLASS1](#glass1) - The core of GemTalk System's [Open Source Development Kit][18].
3. [tODE](#tODE) - The primary development environment for GemTalk System's [Open Source Development Kit][18].
4. [GsDevKit](#gsdevkit) - The eventual successor to **GLASS1**.

I believe that there are developers using each of these environments and 
therefore need to be considered when it comes to upgrading.
The basick idea is that once each of these environments has been upgraded, it
should be straightforward for the develper to reload the rest of their 
projects.

The following sections provide a bit of information about each of the 
environments before we get serious talking about upgrades.

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

## `upgradeSeasideImage` 101
The job of `upgradeSeasideImage` is to pave the way so that the 
GLASS/GLASS1/tODE/GsDevKit code that is appropriate for the target GemStone
version can be loaded and made functional.
Typically this involves:
1. patching key methods in the image that need to be functional **before** 
they are loaded in the normal course of installation.
  - A good example of this would be a private method in a GemStone/S kernel class 
  (say **Behavior**) that is no longer present in the current version of GemStone,
  but is called in the process of loading a **Monticello** package.
2. Making classes obsolete that are no longer needed in the new version of
GemStone.
  - A good example of this is the **Pragma** class that has been part of the 
  **GLASS** since 2007. In 3.4.0, we added **Pragma** as a kernl class in
  GemStone. There can't be two **Pragma** classes so `upgradeSeasideImage`
  needs to make sure that the old **Pragma** class is made obsolete (that way
  any references to the obsolete **Pragma** class post upgrade will result in 
  an error), make sure that any methods that reference the obsolete **Pragma** class
  are recompiled, and finally make sure that instances of the obsolete **Pragma**
  class that may be stored in the classmethod meta data are removed.
3. Clear **Monticello** caches and remove any **ConfigurationOf** classes that
may need to be refreshed before the package loading can take place.
4. Determine which of 4 environments (GLASS/GLASS1/tODE/GsDevKit) are present
in the system and arrange to load/bootstrap the environement into the image.

### BootStrapping/Loading GLASS/GLASS1/tODE/GsDevKit
Once we know which environment we are going to bootstrap/load, we must take into account the state of the existing system post `upgradeImage`.
There are three different upgrade scenarios for the image state post `upgradeImagd`:
1. [Upgrades requiring method recompilation](#upgrades-requiring-method-recompilation).
2. [Upgrades where session method structure is reset](#upgrades-where-session-method-structure-is-reset)
3. [Upgrades where projects can be reloaded](#upgrades-where-projects-can-be-reloaded)

#### Upgrades requiring method recompilation
This upgrade scenario is triggered when a db is upgraded to a version of
GemStone where the shape of the GsNMethod class has changed (3.0 and 3.3
version boundaries).
In this scenario, an error will occur if an attempt is made to invoke a method
that has not been recompiled to the new class format.

To upgrade using a **Monticello**-based package system, it is necessary to 
*bootstrap* the **Monticello** loading code into the image, using only code
that has already been upgraded by `$GEMSTONE/binupgradeImage`.

##### Bootstrap GLASS - GLASS1/GsDevKit - tODE
The simplest way to do this is:
1. remove all of the methods in classes owned by GLASS/GLASS1/tODE/GsDevKit and
all of the extension methods for GemStone kernel classes in the 
GLASS/GLASS1/tODE/GsDevKit packages.
2. use the `extent0.seaside.dbf` *bootstrap* process whereby the **GLASS**
packages are installed, followed by the **GLASS1** or **GsDeVKit** packages (if
called for), followed by the **tODE** packages.
3. have the developer use the standard development tools to load their packages, 
restoring the methods for all of their application classes.

When the process is complete the image should be completely upgraded.

#### Upgrades where session method structure is reset
Up until 3.5.0, this is the scenario that occurred whether or not method
recompilation is required.
Again, the simplest way to do this is to follow the [same steps as those used
when method recompilation is
required](#bootstrap-glass---glass1gsdevkit---tode).

#### Upgrades where projects can be reloaded

## `upgradeSeasideImage` man page
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

## Customizing GsDevKit_upgrade
### GsDevKit_home Installation
```
cd $GS_HOME/shared/repos
git clone https://github.com/GsDevKit/GsDevKit_upgrade.git

stoneName=upgrade_solo
version=3.5.0
GsDevKit_upgrade/scripts/install.sh $stoneName $version
```
### GsDevKit_upgrade development process
1. create a new branch in the GsDevKit_upgrade clone
1. fork the [GsDevKit_upgrade project][19] if you want to share your changes with the rest of the community
1. load and save packages from/to the filetree repository using a development image of your choice
2. use >>deployment script<< to upgdate `GsDevKit_upgrade.gs` file in checkout with your changes
3. test upgrade using the new `GsDevKit_upgrade.gs` file
4. use >>deployment script<< to update the tonel repository with your final edits.
5. update your fork and issue a pull request against [GsDevKit_upgrade project][19] to share your changes.
-------------------------------
-------------------------------
## Url for cloning project in Rowan
```
file:$ROWAN_PROJECTS_HOME/GsDevKit_upgrade/rowan/specs/GsDevKit_upgrade.ston
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
[19]: [1]: https://github.com/GsDevKit/GsDevKit_upgrade
