private
_previousPatchVersionFor: primaryVersionPattern
  "Returns a single digit SmallInteger representing the patch version of the version we are upgrading from."

  | prevVer hist |
  prevVer := 0.
  (Globals at: #'DbfHistory' otherwise: nil)
    ifNotNil: [ :h | 
      | ofs |
      hist := h.
      ofs := hist
        _findLastString: 'upgrade to GemStone'
        startingAt: hist size
        ignoreCase: true.
      ofs == 0
        ifTrue: [ 
          (ImageVersion at: #'gsVersion' otherwise: nil)
            ifNotNil: [ :iVer | 
              ofs := 1.
              hist := '  v' , iVer , '  ' ] ].
      ofs ~~ 0
        ifTrue: [ 
          | subStr |
          subStr := hist copyFrom: 1 to: ofs.
          (subStr
            matchPattern:
              {$*.
             primaryVersionPattern.
              $*})
            ifTrue: [  | idx patchHist pattern |
				idx := hist 
					_findLastString: primaryVersionPattern
					startingAt: hist size
					ignoreCase: true.
				idx = 0
					ifTrue: [ self error: 'patch version not found' ].
				pattern := primaryVersionPattern copyFrom: 2 to: primaryVersionPattern size.
				patchHist :=  hist copyFrom: idx +1 + pattern size to: hist size.
				idx := patchHist _findString: ' '  startingAt: 1 ignoreCase: true.
				^(patchHist copyFrom: 1 to: idx) asNumber ]
            ifFalse: [ self error: 'version matching ', primaryVersionPattern printString, ' not found.' ] ] ].
  prevVer == 0
    ifTrue: [ self error: 'no previous version found' ].
  ^ prevVer