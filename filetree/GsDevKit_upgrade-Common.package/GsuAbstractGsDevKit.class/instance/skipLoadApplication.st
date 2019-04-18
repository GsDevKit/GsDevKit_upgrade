accessing
skipLoadApplication

	^ skipLoadApplication ifNil: [ skipLoadApplication := false ]