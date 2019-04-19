#!/usr/bin/env bash
#
#	create a stash solo extent to be used for running the deployment script
#

cd $GS_HOME/shared/repos

if [ ! -d "stash" ] ; then 
	git clone https://github.com/dalehenrich/stash.git
fi

stoneName=stash_solo_3.5.0

$GS_HOME/shared/repos/stash/bin/install.sh $stoneName 3.5.0

projectSpecUrl="file:$GS_HOME/shared/repos/GsDevKit_upgrade/rowan/specs/GsDevKit_upgrade.ston"
$GS_HOME/shared/repos/stash/scripts/rowan.st --install="$projectSpecUrl"

stopStone -b $stoneName

echo "Solo script extent is ready. Use the follow env vars for easy access to extent from scripts:"
echo "	export GEMSTONE_SCRIPT_SOLO_EXTENT=\"\$GS_HOME/server/stones/$stoneName/snapshots/extent0.solo.dbf\""
echo "	export GEMSTONE_SOLO_SCRIPT_ARGS="$stoneName -lq -C GEM_SOLO_EXTENT=\$GEMSTONE_SCRIPT_SOLO_EXTENT;\""

