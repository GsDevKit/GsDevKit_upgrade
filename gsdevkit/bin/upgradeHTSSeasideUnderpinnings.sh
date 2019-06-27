#!/bin/sh
set -e
die () {
    echo >&2 "$@"
    echo >&2 "Usage: upgradeHTSSeasideUnderpinnings <stoneName> <password>"
    exit 1
}
[ "$#" -eq 2 ] || die "2 arguments required (stone name and password for Dev)"

stone=$1
password=$2

if [ -e ~/.topazini ]
then
	mv ~/.topazini ~/.topazini.upgradeHTSSeasideUnderpinnings
	echo Moved existing .topazini to .topazini.upgradeHTSSeasideUnderpinnings before creating new one
fi
cat <<EOF >~/.topazini
set user Dev password $password gemstone $stone
EOF

# ========================================================================================
# Switch password to default for Dev
topaz -l <<EOF
login
run
"Switch to default password for upgrading"
System myUserProfile oldPassword: '$password' newPassword: 'swordfish'.
%
commit
logout
errorCount
exit
EOF
[ $? -eq 0 ] || exitAfterError "Set password to swordfish"


# ========================================================================================
# Run the GsDevKit_upgrade
cat <<EOF >~/.topazini
set user Dev password swordfish gemstone $stone
EOF
[ $? -eq 0 ] || exitAfterError "Create .topazini"


######################## SHOULD BE UNNECESSARY - DELETE ONCE SO PROVEN
# ========================================================================================
# Unregister unused projects
# topaz -l <<EOF
# login
# run
# (Metacello registrations reject: [:each | each loadedInImage])
# do: [:each | each unregisterProject].
# %
# commit
# logout
# errorCount
# exit
# EOF
#[ $? -eq 0 ] || exitAfterError "Unregister projects"
######################## SHOULD BE UNNECESSARY - DELETE ONCE SO PROVEN

# ========================================================================================
# Enable using the Seaside symbol dictionary for the upgrade
topaz -l <<EOF
login
run
| policy |
policy := GsPackagePolicy current.
policy homeSymbolDict: Seaside.

"Create session methods for any classes classes not in the target Symbol Dictionary.
 (Cannot use #currentSymbolList since it may not have been loaded yet.)"
policy externalSymbolList: (GsCurrentSession currentSession symbolList asArray copyWithout: Seaside).
%
commit
logout
errorCount
exit
EOF
[ $? -eq 0 ] || exitAfterError "Setup package policy"


# We need the home directory for GsDevKit_home, since the upgrade scripts use that model
export GS_HOME=$reposDir/../..
export upgradeLogDir=/home/gs/data/upgradeLogDir
export upgradeDir="$GS_HOME/shared/repos/GsDevKit_upgrade/gemstone"

pushd "${upgradeLogDir}" >& /dev/null
  echo "STARTING GsdevKit_upgrade upgradeImage "
	echo "1. Starting installGsDevKit_upgrade"
#	startTopaz $GEMSTONE_NAME -lq < $GS_HOME/shared/repos/GsDevKit_upgrade/bin/installGsDevKit_upgrade
	topaz -l <$GS_HOME/shared/repos/GsDevKit_upgrade/bin/installGsDevKit_upgrade 2>&1 >$upgradeLogDir/installGsDevKit_upgrade.log
	[ $? -eq 0 ] || exitAfterError "installGsDevKit_upgrade"
	echo "1. Finished installGsDevKit_upgrade"

	echo "2. Starting prepareGsDevKitImage"
#	startTopaz $GEMSTONE_NAME -lq < $GS_HOME/shared/repos/GsDevKit_upgrade/bin/prepareGsDevKitImage
	topaz -l <$GS_HOME/shared/repos/GsDevKit_upgrade/bin/prepareGsDevKitImage 2>&1 >$upgradeLogDir/prepareGsDevKitImage.log
	[ $? -eq 0 ] || exitAfterError "prepareGsDevKitImage"
	echo "2. Finished prepareGsDevKitImage"

	echo "3. Starting prepareGsDevKitImage_pragma_user"
#	startTopaz $GEMSTONE_NAME -lq < $GS_HOME/shared/repos/GsDevKit_upgrade/bin/prepareGsDevKitImage_pragma_user
	topaz -l <$GS_HOME/shared/repos/GsDevKit_upgrade/bin/prepareGsDevKitImage_pragma_user 2>&1 >$upgradeLogDir/prepareGsDevKitImage_pragma_user.log
	[ $? -eq 0 ] || exitAfterError "prepareGsDevKitImage_pragma_user"
	echo "3. Finished prepareGsDevKitImage_pragma_user"

	echo "4. Starting prepareGsDevKitImage_pragma_SystemUser"
#	startTopaz $GEMSTONE_NAME -lq < $GS_HOME/shared/repos/GsDevKit_upgrade/bin/prepareGsDevKitImage_pragma_SystemUser
	topaz -l <$GS_HOME/shared/repos/GsDevKit_upgrade/bin/prepareGsDevKitImage_pragma_SystemUser 2>&1 >$upgradeLogDir/prepareGsDevKitImage_pragma_SystemUser.log
	[ $? -eq 0 ] || exitAfterError "prepareGsDevKitImage_pragma_SystemUser"
	echo "4. Finished prepareGsDevKitImage_pragma_SystemUser"

	echo "5. Starting prepareGsDevKitImage_user"
#	startTopaz $GEMSTONE_NAME -lq -T 500MB < $GS_HOME/shared/repos/GsDevKit_upgrade/bin/prepareGsDevKitImage_user
	topaz -l -T 500MB <$GS_HOME/shared/repos/GsDevKit_upgrade/bin/prepareGsDevKitImage_user 2>&1 >$upgradeLogDir/prepareGsDevKitImage_user.log
	[ $? -eq 0 ] || exitAfterError "prepareGsDevKitImage_user"
	echo "5. Finished prepareGsDevKitImage_user"

	echo "6. Starting loadApplication_user (Metacello, Grease, GLASS, Seaside, etc.)"
	topaz -l <$GS_HOME/shared/repos/GsDevKit_upgrade/bin/loadApplication_user 2>&1 >$upgradeLogDir/loadApplication_user.log
	[ $? -eq 0 ] || exitAfterError "loadApplication_user"
	echo "6. Finished loadApplication_user"

#	echo "7. Starting reloadSessionMethods_user"
#echo "##### Not implemented yet #####"
##	topaz -l <$GS_HOME/shared/repos/GsDevKit_upgrade/bin/reloadSessionMethods_user 2>&1 >$upgradeLogDir/reloadSessionMethods_user.log
#	[ $? -eq 0 ] || exitAfterError "reloadSessionMethods_user"
#	echo "6. Finished reloadSessionMethods_user"
popd


# ========================================================================================
# Clean up left-overs from SystemUser
topaz -l <<EOF
display resultcheck
level 0
limit bytes 2000
limit lev1bytes 2000
display oops
iferr 1 stk
iferr 2 stack
iferr 3 input pop
set user SystemUser password swordfish gemstone $stone
login

run
	UserGlobals removeKey: #'GsDevKit_Image_Upgrade' ifAbsent: [].
	UserGlobals removeKey: #'GsDevKit_Upgrade_Cache' ifAbsent: [].
System commitTransaction.
%

expectvalue 0
errorcount
exit
EOF
[ $? -eq 0 ] || exitAfterError "Cleanup UserGlobals"


# ========================================================================================
# Reset passwords for the users which were changed
topaz -l <<EOF
login
run
"Revert to real password after upgrading"
System myUserProfile oldPassword: 'swordfish' newPassword: '$password'.
%
commit
logout
errorCount
exit
EOF
[ $? -eq 0 ] || exitAfterError "Revert Dev password"



cleanup_topazini () {
rm ~/.topazini
if [ -e ~/.topazini.upgradeHTSSeasideUnderpinnings ]
then
	mv ~/.topazini.upgradeHTSSeasideUnderpinnings ~/.topazini
	echo Restored existing .topazini from .topazini.upgradeHTSSeasideUnderpinnings
fi
}

exitAfterError () {
	echo "Failed in `basename $0` step $@"
	cleanup_topazini
	exit 2
}
cleanup_topazini
exit 0

