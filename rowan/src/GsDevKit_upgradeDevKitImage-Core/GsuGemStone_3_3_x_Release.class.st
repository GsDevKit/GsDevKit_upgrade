Class {
	#name : 'GsuGemStone_3_3_x_Release',
	#superclass : 'GsuAbstractGemStoneRelease',
	#category : 'GsDevKit_upgradeDevKitImage-Core'
}

{ #category : 'phases' }
GsuGemStone_3_3_x_Release >> prepareImage_makeClassesObsolete: aGsDevKitUpgrade [
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class  must be obsoleted"

	aGsDevKitUpgrade log: 'Prepare image - obsolete classes'.
	aGsDevKitUpgrade prepareImage_makeClassObsolete: 'Pragma' in: aGsDevKitUpgrade upgradeSymbolDict
]

{ #category : 'phases' }
GsuGemStone_3_3_x_Release >> prepareImage_pragmas_withPragmas_source [
	"3.3.x source for Pragma>>withPragmasIn:do: ... needed to extract pragmas from the 3.3.x prgama data structures"

	^'withPragmasIn: aClass do: aBlock
(aClass methodDictForEnv: 0) keysAndValuesDo: [ :selector :method | 
	| pragmas methodPragmaDict eDict selSym |
	selSym := Symbol _existingWithAll: selector.
  selSym ifNil: [ ^ #() ].
	pragmas := GsPackagePolicy currentOrNil
		ifNotNil: [ :pp | pp pragmasForMethod: selSym in: aClass ].
	pragmas ifNotNil: [ ^ pragmas ].
	(eDict := self extraDict) ifNil: [ ^ #() ].
	(methodPragmaDict := eDict at: self pragmaDictName otherwise: nil)
		ifNil: [ ^ #() ].
  ^ methodPragmaDict at: selSym otherwise: #() ]'
]

{ #category : 'phases' }
GsuGemStone_3_3_x_Release >> prepareImage_pragmasFor: aGsDevKitUpgrade [
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class is be obsoleted,
		so we need to collect all of the methods that have pragmas and then recompile them 
		to use the new Pragma class ... when we are ready. "

	aGsDevKitUpgrade log: 'Prepare image - pragmas'.
	aGsDevKitUpgrade prepareImage_pragmas
]
