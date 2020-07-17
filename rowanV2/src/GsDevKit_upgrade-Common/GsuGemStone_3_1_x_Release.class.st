Class {
	#name : 'GsuGemStone_3_1_x_Release',
	#superclass : 'GsuAbstractGemStoneRelease',
	#category : 'GsDevKit_upgrade-Common'
}

{ #category : 'accessing' }
GsuGemStone_3_1_x_Release >> minor [

	^ minor ifNil: [ 1 ]
]

{ #category : 'prepare image' }
GsuGemStone_3_1_x_Release >> prepareImage_makeClassesObsolete: aGsDevKitUpgrade [
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class  must be obsoleted"

	"In 3.1.0.6, bootstrapMaster30 script ignores BootstrapSymbolDictionaryName, so Pragma installed in Seaside user's UserGlobals"

	super prepareImage_makeClassesObsolete: aGsDevKitUpgrade.
	aGsDevKitUpgrade prepareImage_makeClassObsolete: 'Pragma' in: (aGsDevKitUpgrade upgradeUserProfile objectNamed: 'UserGlobals')
]
