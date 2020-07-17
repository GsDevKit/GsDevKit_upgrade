logging
timeStampedLog: aString
	"DateAndTime cannot reliably be printed during upgrade, because GLASS methods 
		are being called and those methods may not have been updated for the new release"

	self log: aString