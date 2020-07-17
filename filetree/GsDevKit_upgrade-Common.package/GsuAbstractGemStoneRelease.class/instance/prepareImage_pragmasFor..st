prepare image
prepareImage_pragmasFor: aGsDevKitUpgrade
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class is be obsoleted,
		so we need to collect all of the methods that have pragmas and then recompile them 
		to use the new Pragma class ... when we are ready. "

	"Part 1: set the stage for pragma upgrade"

	aGsDevKitUpgrade timeStampedLog: 'Prepare image - pragmas'.

	"noop by default"
	aGsDevKitUpgrade log: '	pragmas (noop)'.