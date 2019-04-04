#!/usr/bin/smalltalk
"
a Stash Script
"
Class {
	#name : 'runImageTests',
	#superclass : 'StashScript',
	#instVars : [
		'stoneName',
		'sessionDescription'
	],
	#category : 'Stash-Scripts'
}


{ #category : 'script execution' }
runImageTests >> executeScript [
	"Called to initiate execution of the script"
	^ opts
			at: 'help'
			ifAbsent: [ 
				self installPrereqs.
				opts at: 'stoneName' ifPresent: [:arg | 
					stoneName := arg.
					self sessionDescription ].
				 ]
			ifPresent: [ self usage ]
]

{ #category : 'script execution' }
runImageTests >> scriptOptions [
	"specify the command line options"
	^ {
			#('help' $h #none).
			#('stoneName' nil #required).
			#('test' nil #none).
	}
]

{ #category : 'prereqs' }
runImageTests >> installPrereqs [
	"Load TDSessionDescription from the tODE clone in GsDevKit_home"

	"create method needed by TDSessionDescription #hack"
	Object
		compileMethod: 'instVarNamed: aString put: aValue
  "Store into the value of the instance variable in me of that name.  Slow and unclean, but very useful. "

  ^ self
    instVarAt: (self class allInstVarNames indexOfIdentical: aString asSymbol)
    put: aValue'
		dictionaries: System myUserProfile symbolList
		category: 'runImageTests'.
	"define some globals that are in code, I'm not using #hack"
	UserGlobals 
		at: #Smalltalk put: nil;
		at: #FileStream put: nil;
		at: #Color put: nil;
		at: #TodeObjectSerializer put: nil;
		yourself.
	Rowan classTools stashClassTool 
		loadFiletreeClassDirectory: '$GS_HOME/shared/repos/tode/repository/Topez-Common-Core.package/TDSessionDescription.class'
		 projectName: 'runImageTests' 
		packageName: 'runImageTests-SessionDescription'
]

{ #category : 'accessing' }
runImageTests >> sessionDescription [

	^ sessionDescription ifNil: [
		('$GS_HOME/sys/local/sessions/', stoneName) asFileReference 
			readStreamDo: [:fileStream | 
				| readStream |
				readStream := ZnBufferedReadStream on: fileStream.
				sessionDescription := STON fromStream: readStream ] ].
]

{ #category : 'usage' }
runImageTests >> usage [
	"Man page for script"
	| dashes |
	dashes := '----------------------------------------------------
'.
	^ dashes,
		(self manPageClass
			fromString:
'NAME
	runImageTests.st - example script, that can be used as a template to create your own script
SYNOPSIS
	runImageTests.st 	[-h|--help] \
										--stoneName=<stone-name> \
										[ -- <startTopaz-specific-options> ]
DESCRIPTION

EXAMPLES
	runImageTests.st --help
	runImageTests.st -h

	runImageTests.st -h -- myStone -lq
') printString, dashes
]
