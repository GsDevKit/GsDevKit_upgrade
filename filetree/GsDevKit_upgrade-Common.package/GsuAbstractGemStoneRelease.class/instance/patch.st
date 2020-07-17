accessing
patch

	^ patch ifNil: [ patch := self class _previousPatchVersionFor: self major asString, '.', self minor asString, '.' ]