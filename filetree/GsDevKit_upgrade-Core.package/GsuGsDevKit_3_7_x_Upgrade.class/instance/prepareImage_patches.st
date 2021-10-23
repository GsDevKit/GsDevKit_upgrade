prepare image
prepareImage_patches
	"need to arrange for SequenceableCollection>>readStream to return an AnsiReadStream "

	| category |
	category := #'49622 experiment'.
	super prepareImage_patches.

	self
		timeStampedLog:
			'	patch SequenceableCollection >> readStream in category '
				, category asString printString , ' as ' , System myUserProfile userId.
	(SequenceableCollection
		compileMethod: 'readStream ^ AnsiReadStream on: self'
		dictionaries: self upgradeUserProfile symbolList
		category: category) ifNotNil: [ :ar | self error: 'did not compile' ]