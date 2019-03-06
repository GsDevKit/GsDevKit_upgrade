accessing
upgradeUserName

	^ upgradeUserName ifNil: [ upgradeUserName := self _gemstone_user ]