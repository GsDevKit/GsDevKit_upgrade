prepare gsdevkit  image
prepareGsDevKitImage_cleanSessionMethodMetaData
	"remove all instances of GsMethod from session method packages"

	| obsoleteGsMethodClass |
	obsoleteGsMethodClass := ObsoleteClasses at: #'GsMethod'.
	obsoleteGsMethodClass
		ifNil: [ 
			self
				timeStampedLog:
					'SKIP - clean session method state (no GsMethod class in ObsoleteClasses'.
			^ self ].
	self timeStampedLog: 'Prepare gsdevkit - clean session method state '.

	GsPackagePolicy current
		packages_Do: [ :gsPackage | 
			| badBoys |
			badBoys := Dictionary new.
			gsPackage sessionMethods
				keysAndValuesDo: [ :behavior :ar | 
					(ar at: 1)
						keysAndValuesDo: [ :selector :method | 
							(method isKindOf: obsoleteGsMethodClass)
								ifTrue: [ (badBoys at: behavior ifAbsentPut: [ Set new ]) add: selector ] ] ].
			badBoys
				keysAndValuesDo: [ :beh :sels | sels do: [ :sel | gsPackage removeMethodAt: sel for: beh ] ] ].

	System commit.

	self log: '	methods removed from session methods (commit)'