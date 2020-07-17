application loading
removeExistingConfigurations

	"Remove the known list of Metacello configuration classes (they have either had their methods removed or 
		may not be the write versoin of the package, either way they need to be reloaded."

	| count |

	self timeStampedLog: '	removing configuration classes'.

	ClassOrganizer clearCachedOrganizer.

	count := self bootstrapExistingConfigurationList size.
	self bootstrapExistingConfigurationList do: [:class | 
		self log: '		', class name.
		class removeFromSystem ].
	self log: '	done removing configuration classes (', count asString, ')'.

	"set the cache repository"
	(self _globalNamed: 'MCCacheRepository') 
		ifNotNil: [:mCCacheRepository | 
			mCCacheRepository setDefault: (self _globalNamed: 'MCDictionaryRepository') new ].