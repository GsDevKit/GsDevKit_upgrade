My subclasses and I represent the image being upgraded. The classes in the GsuAbstractGsDevKitUpgrade 
hierarchy represents the GemStone version being upgraded to. 

The specific GsuAbstractGsDevKitUpgrade sends messages to the image being upgraded and depending 
upon the version I represent, I send messages back to the GsuAbstractGsDevKitUpgrade which basically
describe the set of operations that need to be performed on the image to correctly upgrade to the 
target version.

There are 5 phases of the upgrade:
	1. prepareImage
	2. prepareImage_pragma_user
	3. prepareImage_pragma_systemuser
	4. prepareImage_user
	5. prepareGsDevKitImage.