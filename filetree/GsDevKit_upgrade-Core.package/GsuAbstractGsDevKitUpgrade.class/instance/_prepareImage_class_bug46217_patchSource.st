private
_prepareImage_class_bug46217_patchSource

	^  'removeFromSystem
  "Bug 46217 - during bootstrap don''t remove any classes.
    during initial bootstrap no classes will be removed
    during upgrade unexpected classes should not be removed during the
      bootstrap operation"'