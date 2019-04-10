debugging
_upgradeClassOops
	"answer a dictionary whose keys are class names and whose values are the oop of the named class."

	"
		(UserGlobals at: #GsDevKit_Image_Upgrade) _upgradeClassOops
	or
		(((AllUsers userWithId: 'SystemUser') 
		objectNamed: #UserGlobals) 
			at: #'GsDevKit_Image_Upgrade') _upgradeClassOops
	"

	| dict |
	dict := Dictionary new.
	self class _symbolDictionary keysAndValuesDo: [:className :class |
		dict at: className put: class asOop ].
	^dict