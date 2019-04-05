private
_defaultExistingConfigurationOfNames
	" These two configurations are the only configurations that must be removed, before loading GLASS1 or GsDevKit or tODE"

	^ { #ConfigurationOfGsMisc . #ConfigurationOfGsCore }