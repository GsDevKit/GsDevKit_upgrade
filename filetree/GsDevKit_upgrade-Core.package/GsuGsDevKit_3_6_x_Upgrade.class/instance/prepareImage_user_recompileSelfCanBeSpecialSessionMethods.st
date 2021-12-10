prepare image user
prepareImage_user_recompileSelfCanBeSpecialSessionMethods
	"Needed for installing GsdevKit/GLASS, 3.6.x and later"

	self
		timeStampedLog:
			'	recompile extension methods in Date DateAndTimeANSI DateAndTime ScaledDecimal Time (classes with selfCanBeSpecial option)'.
	GsPackagePolicy currentOrNil
		ifNotNil: [ :pp | 
			{Date.
			DateAndTimeANSI.
			DateAndTime.
			ScaledDecimal.
			Time}
				do: [ :class | 
					{class.
					(class class)}
						do: [ :beh | 
							| categ dictsArray mDict cDict |
							dictsArray := pp
								methodAndCategoryDictionaryFor: beh
								source: 'youself'
								dictionaries: GsCurrentSession currentSession symbolList
								category: categ.
							mDict := dictsArray at: 1.
							cDict := dictsArray at: 2.
							mDict
								valuesDo: [ :meth | 
									meth
										recompileIntoMethodDict: mDict
										intoCategories: cDict
										symbolList: GsCurrentSession currentSession symbolList ] ] ] ]