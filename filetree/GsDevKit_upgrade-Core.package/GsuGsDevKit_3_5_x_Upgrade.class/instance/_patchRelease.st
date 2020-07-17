private
_patchRelease
	| baseVersion imageVersion |
	baseVersion := self major asString , '.' , self minor asString , '.'.
	imageVersion := ImageVersion at: #'gsVersion'.
	^ Integer
		fromString:
			(imageVersion copyFrom: baseVersion size + 1 to: imageVersion size)