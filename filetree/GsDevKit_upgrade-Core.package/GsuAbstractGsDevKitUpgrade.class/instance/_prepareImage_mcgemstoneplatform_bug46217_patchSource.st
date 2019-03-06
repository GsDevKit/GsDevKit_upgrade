private
_prepareImage_mcgemstoneplatform_bug46217_patchSource

	^'removeClassFromSystem: aClass

  ((GsSession currentSession objectNamed: #UserGlobals) 
      at: #''GS_BOOTSTRAP_MONTICELLO_SKIP_REMOVE_CLASS'' ifAbsent: [ false ]) 
    ifTrue: [
      "Bug 46217 - during bootstrap don''t remove any classes.
        during initial bootstrap no classes will be removed
        during upgrade unexpected classes should not be removed during the
          bootstrap operation" ]
    ifFalse: [
	| ar |
	aClass subclasses isEmpty not ifTrue: [ ^self error: ''class has subclasses'' ].
	ar := System myUserProfile dictionaryAndSymbolOf: aClass.
	ar ifNil: [ ^self error: ''class not found in current user profile'' ].
	(ar at: 1) removeKey: (ar at: 2) ]'