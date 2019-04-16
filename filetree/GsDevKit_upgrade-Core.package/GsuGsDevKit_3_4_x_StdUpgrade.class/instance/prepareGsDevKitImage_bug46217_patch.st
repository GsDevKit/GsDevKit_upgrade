prepare gsdevkit  image
prepareGsDevKitImage_bug46217_patch

	"Bug 46217 - during bootstrap don''t remove any classes.
		during initial bootstrap no classes will be removed
		during upgrade unexpected classes should not be removed during the
		bootstrap operation"

	self log: 'Prepare gsdevkit - patch 46217'.

	GsPackageLibrary 
	  installMonticelloPackagesHome: (GsCurrentSession currentSession objectNamed: #'UserGlobals') 
	  during: [:globals | 
		(Class
		  compileMethod: self _prepareImage_class_bug46217_patchSource
		dictionaries: GsCurrentSession currentSession symbolList
		category: '*change-notification') ifNotNil: [:ar | self error: 'did not compile' ].
	  ].

	System commit.

	self log: '	46217 patched (commit)'.