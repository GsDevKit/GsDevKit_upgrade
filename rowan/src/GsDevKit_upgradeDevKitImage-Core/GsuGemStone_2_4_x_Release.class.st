Class {
	#name : 'GsuGemStone_2_4_x_Release',
	#superclass : 'GsuAbstractGemStoneRelease',
	#category : 'GsDevKit_upgradeDevKitImage-Core'
}

{ #category : 'accessing' }
GsuGemStone_2_4_x_Release >> minor: anInteger [

	anInteger ~= 4 ifTrue: [ self error: 'GemStone version 2.', anInteger printString, ' not supported' ].
	super minor: anInteger
]

{ #category : 'prepare image' }
GsuGemStone_2_4_x_Release >> prepareImage_makeClassesObsolete: aGsDevKitUpgrade [
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class  must be obsoleted"

	"In 3.1.0.6, bootstrapMaster30 script ignores BootstrapSymbolDictionaryName, so Pragma installed in Seaside user's UserGlobals"

	| symDict |

	super prepareImage_makeClassesObsolete: aGsDevKitUpgrade.
	aGsDevKitUpgrade prepareImage_makeClassObsolete: 'Pragma' in: (aGsDevKitUpgrade upgradeUserProfile objectNamed: 'UserGlobals').

	symDict := aGsDevKitUpgrade upgradeSymbolDict.
	(symDict at: #ObsoleteHalt ifAbsent: []) ifNil: [ 
        "2.4 versions of 2.x classes are no longer used.  Need to make obsolete, so that it's obvious
         that surviving subclasses are in wrong class hierachy."
		#( 'BreakpointNotification' 'Pause' 'Halt' 'ControlInterrupt' 'TransientRandom' 'Random' )
			  do: [:className | aGsDevKitUpgrade prepareImage_makeClassObsolete: className in: symDict ] ].
]
