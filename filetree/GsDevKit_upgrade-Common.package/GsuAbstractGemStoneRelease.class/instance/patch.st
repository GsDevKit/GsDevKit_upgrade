accessing
patch

	^ patch ifNil: [ patch := self class _previousPatchVersionFor: 'v', self major asString, '.', self minor asString, '.' ]