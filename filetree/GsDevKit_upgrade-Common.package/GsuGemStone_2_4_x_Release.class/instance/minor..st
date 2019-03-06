accessing
minor: anInteger

	anInteger ~= 4 ifTrue: [ self error: 'GemStone version 2.', anInteger printString, ' not supported' ].
	super minor: anInteger