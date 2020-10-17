private
_upgradedVersionInt
	"return a 2 digit SmallInteger that represents the GemStone version being upgraded from"

	| ofs hist |
	(hist := Globals at: #'DbfHistory' otherwise: nil)
		ifNil: [ ^ GsPackagePolicy _originVersion ].
	ofs := hist
		_findLastString: 'upgrade to GemStone'
		startingAt: hist size
		ignoreCase: true.
	ofs > 0
		ifTrue: [ 
			"Trim off the last upgrade version so we can get the previous."
			hist := hist copyFrom: 1 to: ofs - 1 ].
	ofs == 0
		ifTrue: [ 
			(ImageVersion at: #'gsVersion' otherwise: nil)
				ifNotNil: [ :iVer | 
					ofs := 1.
					hist := '  v' , iVer , '  ' ] ].
	ofs ~~ 0
		ifTrue: [ 
			#(36 35 34 33 32)
				do: [ :ver | 
					| num vStr |
					num := ScaledDecimal numerator: ver denominator: 10 scale: 1.
					vStr := 'v' , num asString , '.'.
					(hist
						matchPattern:
							{$*.
							vStr.
							$*})
						ifTrue: [ ^ ver ].
					vStr := ' ' , num asString , '.'.
					(hist
						matchPattern:
							{$*.
							vStr.
							$*})
						ifTrue: [ ^ ver ] ] ].
	^ GsPackagePolicy _originVersion