bootstrapping
upgradeGlass

	"use GsUpgrader to upgrade GLASS to usable version: GLASS 1.0-beta.9.3' "

	self log: '	install GLASS  1.0-beta.9.3'.

	self bootstrapGlass.

	"install GsUpgrader"
	self log: '	install GsUpgrader'.
	(self _globalNamed: 'Gofer') new 
		url: 'http://ss3.gemtalksystems.com/ss/gsUpgrader';
		package: 'GsUpgrader-Core';
		load.

	self log: '	upGrade GLASS to 1.0-beta.9.3'.
	(self _globalNamed: 'GsUpgrader') upgradeGLASS.

	self bannerLogDash.
	self bannerLogDash.

	self log: '	... done upgrade GLASS to 1.0-beta.9.3'.