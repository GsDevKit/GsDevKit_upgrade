prepare image
prepareImage_makeClassesObsolete: aGsDevKitUpgrade
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class  must be obsoleted"

	"In 3.1.0.6, bootstrapMaster30 script ignores BootstrapSymbolDictionaryName, so Pragma installed in Seaside user's UserGlobals"

	super prepareImage_makeClassesObsolete: aGsDevKitUpgrade.
	aGsDevKitUpgrade prepareImage_makeClassObsolete: 'Pragma' in: (aGsDevKitUpgrade upgradeUserProfile objectNamed: 'UserGlobals')