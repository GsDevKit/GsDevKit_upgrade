#!/usr/bin/smalltalk
"
a Stash Script
"
Class {
	#name : 'runImageTests',
	#superclass : 'StashScript',
	#instVars : [
		'stoneName',
		'sessionDescription',
		'externalSession'
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
				opts at: 'stoneName' ifPresent: [:arg | stoneName := arg ].
				self runRemoteTests ]
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

{ #category : 'script execution' }
runImageTests >> runRemoteTests [
	[self externalSession 
		executeBlock: [
			| stream results defects |
			stream := WriteStream on: String new.
			stream 
				nextPutAll: 'Running image test cases';	lf;
				nextPutAll: '------------------------'; lf;
				nextPutAll: '------------------------'; lf.
			results := TestCase suite run .
			defects := results defects.
			stream nextPutAll: results printString; lf.
			defects isEmpty 
				ifTrue: [ stream nextPutAll: '------------------------'; lf ]
				ifFalse: [
					defects do: [:each | 
						stream nextPutAll: each printString; lf ].
				stream nextPutAll: '------------------------'; lf ].
			^ stream contents ] ]
	ensure: [ self externalSession logout ]
]

{ #category : 'accessing' }
runImageTests >> externalSession [

	^ externalSession ifNil: [
			externalSession := GsExternalSession 
				gemNRS: self sessionDescription gemNRS 
				stoneNRS: self sessionDescription stoneNRS 
				username: self sessionDescription userId 
				password: self sessionDescription password.
			externalSession login ]
]

{ #category : 'accessing' }
runImageTests >> sessionDescription [

	^ sessionDescription ifNil: [
		sessionDescription := 
			('$GS_HOME/sys/local/sessions/', stoneName) asFileReference 
				readStreamDo: [:fileStream | 
					| readStream |
					readStream := ZnBufferedReadStream on: fileStream.
					sessionDescription := STON fromStream: readStream ] ].
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
