private
_prepareImage_user_class_bug46059_patchSource

	^ 'removeFromSystem
| ar |
  ar := System myUserProfile dictionaryAndSymbolOf: self.
  ar ifNotNil: [ (ar at: 1) removeKey: (ar at: 2) ].'