prepare gsdevkit  image
prepareGsDevKitImage_bug49622_patch
	"Bug 49622 - starting in 3.7.0 ReadByteStream an optimized version of ReadStream should be used 
		in GLASS applications instead of AnsiReadStream in subclasses of SequenceableCollection"

	"noop for pre-3.7.0 upgrades"