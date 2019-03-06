accessing
targetGemStoneRelease

	^ targetGemStoneRelease 
		ifNil: [ targetGemStoneRelease := self _defaultTargetRelease ]