prepare image
prepareImage_makeClassesObsolete: aGsDevKitUpgrade
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class  must be obsoleted"

	"noop by default"

	aGsDevKitUpgrade timeStampedLog: 'Prepare image - obsolete classes'.