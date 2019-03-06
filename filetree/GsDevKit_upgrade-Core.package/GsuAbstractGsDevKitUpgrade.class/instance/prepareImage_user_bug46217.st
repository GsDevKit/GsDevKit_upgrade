prepare image user
prepareImage_user_bug46217
	"patch needed: 3.2.0 thru 3.2.15, and 3.3.0 - run as GsDevKit user"

	self log: '	set GS_BOOTSTRAP_MONTICELLO_SKIP_REMOVE_CLASS global true (bug 46217)'.
	self _currentUserGlobals at: #'GS_BOOTSTRAP_MONTICELLO_SKIP_REMOVE_CLASS' put: true.