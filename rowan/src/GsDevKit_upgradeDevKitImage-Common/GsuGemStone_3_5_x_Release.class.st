Class {
	#name : 'GsuGemStone_3_5_x_Release',
	#superclass : 'GsuAbstractGemStoneRelease',
	#category : 'GsDevKit_upgradeDevKitImage-Common'
}

{ #category : 'private' }
GsuGemStone_3_5_x_Release >> _bootstrapPackageFileNames_0 [

	"answer an ordered list of the Monticello packages that are needed to bootstrap GsDevKit/GLASS into image"

	"for 3.5.0"

	^{ 
		'Core.v3-dkh.79.mcz' .
		'Base-Bootstrap.v3-dkh.29.mcz'.
		'Bootstrap.v34-dkh.261.mcz'.
		'GemStone-ANSI-Streams-dkh.9.mcz'.
		'GemStone-Indexing-Extensions-dkh.4.mcz'.
		'Sport3.010.v3-dkh.29.mcz'.
		'Squeak.v34-dkh.339.mcz'.
		'Regex-Core-DaleHenrichs.3.mcz'.
		'Regex-Tests-Core-DaleHenrichs.5.mcz'.
		'PackageInfo-Base.g-dkh.36.mcz'.
		'Monticello.v3-dkh.456.mcz'.
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
	}.
]

{ #category : 'bootstrapping' }
GsuGemStone_3_5_x_Release >> bootstrapPackageFileNames [

	"answer an ordered list of the Monticello packages that are needed to bootstrap GsDevKit/GLASS into image"

	^self _bootstrapPackageFileNames_0
]
