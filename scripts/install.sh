#!/usr/bin/env bash
#
#	install stash and Rowan, then create a stash solo extent to be used for 
#	running the deployment script
#
set -e 

cd $GS_HOME/shared/repos

if [ ! -d "stash" ] ; then 
	git clone https://github.com/dalehenrich/stash.git
fi

if [ $# -ne 2 ] ; then
	echo "missing two required arguments <stone-name> <gemstone-version>"
	exit 1
else
	stoneName="$1"
	version="$2"
	shift
	shift
fi

$GS_HOME/shared/repos/stash/bin/install.sh $stoneName $version

projectSpecUrl="file:$GS_HOME/shared/repos/GsDevKit_upgrade/rowan/specs/GsDevKit_upgrade.ston"
$GS_HOME/shared/repos/stash/scripts/rowan.st --install="$projectSpecUrl"

$GS_HOME/shared/repos/stash/scripts/snapshot.st solo.dbf

stopStone -b $stoneName

echo "Solo script extent is ready. Use the follow env vars for easy access to extent from scripts:"
echo "	export GEMSTONE_SCRIPT_SOLO_EXTENT=\"\$GS_HOME/server/stones/$stoneName/snapshots/extent0.solo.dbf\""
echo "	export GEMSTONE_SOLO_SCRIPT_ARGS="$stoneName -lq -C GEM_SOLO_EXTENT=\$GEMSTONE_SCRIPT_SOLO_EXTENT;\""

