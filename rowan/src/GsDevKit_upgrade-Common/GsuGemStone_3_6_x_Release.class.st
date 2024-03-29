Class {
	#name : 'GsuGemStone_3_6_x_Release',
	#superclass : 'GsuGemStone_3_5_x_Release',
	#category : 'GsDevKit_upgrade-Common'
}

{ #category : 'bootstrapping' }
GsuGemStone_3_6_x_Release >> bootstrapPackageFileNames [
	"answer an ordered list of the Monticello packages that are needed to bootstrap GsDevKit/GLASS into image"

	self error: 'Bootstrap upgrades not supported for GemStone 3.6.x and beyond'
]

{ #category : 'accessing' }
GsuGemStone_3_6_x_Release >> minor [

	^ minor ifNil: [ 6]
]

{ #category : 'prepare gsdevkit image' }
GsuGemStone_3_6_x_Release >> prepareGsDevKitImage_patch__optionsForDefinition: aGsDevKitUpgrade [
	"in 3.6 Class>>_optionsForDefinition was replaced by Class>>_optionsStringForDefinition ... in 3.7, this became a problem so the method must be patched when upgrading to 3.7.0 from 3.4.x through 3.5.x"

	"noop 3.6 and beyond"
]

{ #category : 'bootstrapping' }
GsuGemStone_3_6_x_Release >> reloadBootstrapPackageFileNames [
	"answer an ordered list of the Monticello packages that are needed to reload GLASS into image"

	^ {'GemStone-Compression-dkh.1.mcz'.
	'Core.v3-dkh.85.mcz'.
	'GemStone-Compression-dkh.3.mcz'.
	'Base-Bootstrap.v3-dkh.29.mcz'.
	'Bootstrap.v34-dkh.265.mcz'.
	'GemStone-ANSI-Streams-dkh.9.mcz'.
	'GemStone-Indexing-Extensions-dkh.3.mcz'.
	'Sport3.010.v3-dkh.29.mcz'.
	'Squeak.v36-dkh.341.mcz'.
	'Regex-Core-DaleHenrichs.3.mcz'.
	'Regex-Tests-Core-DaleHenrichs.5.mcz'.
	'PackageInfo-Base.g-dkh.36.mcz'.
	'Monticello.v3-dkh.459.mcz'.
	'GemStone-Deployment.v310-dkh.26.mcz'.
	'Change-Notification.v3-dkh.20.mcz'.
	'Gofer-Core.gemstone-dkh.135.mcz'.
	'Metacello-Base-dkh.103.mcz'.
	'Metacello-Core-dkh.669.mcz'.
	'Metacello-MC-dkh.669.mcz'.
	'Metacello-Platform.gemstone-dkh.29.mcz'.
	'Metacello-ToolBox-dkh.131.mcz'.
	'Metacello-FileTree-dkh.29.mcz'.
	'Metacello-GitHub-dkh.22.mcz'.
	'Network-Url-dkh.3.mcz'.
	'Utf8Encoding.310-dkh.32.mcz'}
]
