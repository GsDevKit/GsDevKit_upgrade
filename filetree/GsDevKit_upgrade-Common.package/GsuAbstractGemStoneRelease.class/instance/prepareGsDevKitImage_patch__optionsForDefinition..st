prepare gsdevkit image
prepareGsDevKitImage_patch__optionsForDefinition:  aGsDevKitUpgrade
  "in 3.6 Class>>_optionsForDefinition was replaced by Class>>_optionsStringForDefinition ... in 3.7, this became a problem so the method must be patched when upgrading to 3.7.0 from 3.4.x through 3.5.x"

	aGsDevKitUpgrade prepareGsDevKitImage_patch__optionsForDefinition