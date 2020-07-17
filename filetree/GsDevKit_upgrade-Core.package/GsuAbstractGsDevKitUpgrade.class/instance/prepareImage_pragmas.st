prepare image
prepareImage_pragmas
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class is be obsoleted,
		so we need to collect all of the methods that have pragmas and then recompile them 
		to use the new Pragma class ... when we are ready. "

	"For 3.2.x, all methods need to be recompiled ... pragma data structures should be destroyed 
		before all methods reloaded"

	"For 3.3.x we'll need to recompile all methods that have pragmas, so that new structure is used"

	"Part 1: set the stage for pragma upgrade"

	| pragmaClass |

	"need to make sure that this method is used so that we can extract pragmas from old structures"
	self timeStampedLog: '	Installing ...Pragma>>withPragmasIn:do:'.
	(pragmaClass := self upgradeSymbolDict at: #Pragma ifAbsent: [])
		ifNil: [ ^ self log: '	No Pragma class found in ', self upgradeSymbolDict name asString, ' symbol dictionary' ].
	self log: '	Old pragma class ', pragmaClass name printString, '[', pragmaClass asOop printString, '] -- will be made obsolete'.
	(pragmaClass class
		compileMethod: self _prepareImage_pragmas_withPragmas_source 
		dictionaries: self upgradeUserProfile symbolList 
		category: 'Updatting the Method Dictionary -- during upgrade') ifNotNil: [:ar | self error: 'did not compile' ].