private
_patchRelease
	| baseVersion imageVersion |
	baseVersion := self _baseVersion.
	imageVersion := ImageVersion at: #'gsVersion'.
	^ Integer
		fromString:
			(imageVersion copyFrom: baseVersion size + 1 to: imageVersion size)