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
		'imageType',
		'gemStoneVersion',
		'gemStoneId'
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
				self runTests ]
			ifPresent: [ self usage ]
]

{ #category : 'script execution' }
runImageTests >> scriptOptions [
	"specify the command line options"
	^ {
			#('help' $h #none).
			#('stoneName' nil #required).
			#('imageType' nil #required).
			#('gemStoneVersion' nil #required).
	}
]

{ #category : 'script execution' }
runImageTests >> runTests [
]

{ #category : 'private' }
runImageTests >> _performOnServer: commandLine [

  ^ self _performOnServer: command logging: true
]

{ #category : 'private' }
runImageTests >> _performOnServer: commandLine status: statusBlock [

	| performOnServerStatusArray |
	performOnServerStatusArray := System _performOnServer: commandLine.
	^ statusBlock value: performOnServerStatusArray
]

{ #category : 'private' }
runImageTests >> _performOnServer: commandLine logging: logging [
  | result |
  result := self
    _performOnServer: commandLine
    status: [ :performOnServerStatusArray | 
      "Array of 5 elements: 
       raw status Integer, 
       child process status Integer (after WEXITSTATUS macro applied), 
       result String (or nil if operation failed) ,
       error string from script file write, fork, or result file read ,
       errno value, a SmallInteger from file write, fork, or file read"
      (performOnServerStatusArray at: 1) ~~ 0
        ifTrue: [ 
          | message |
          message := 'performOnServer: ' , commandLine printString , ' stdout: '
            , (performOnServerStatusArray at: 3) printString
            , ' failed with status: '
            , (performOnServerStatusArray at: 1) printString , ' errno: '
            , (performOnServerStatusArray at: 5) printString , ' errStr: '
            , (performOnServerStatusArray at: 4) asString.
          self error: message ].
      performOnServerStatusArray at: 3 ].
  logging
    ifTrue: [ 
      Transcript
        cr;
        show: commandLine printString;
        cr;
        show: result ].
  ^ result
]

{ #category : 'private' }
runImageTests >> _sourceForBlock: aBlock [

	| source |
	source := aBlock _sourceString.
	^ source copyFrom: (source indexOf: $[) + 1 to: source size - 1.
]

{ #category : 'private' }
runImageTests >> _testBlock [
	^ [
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
		stream contents ]
]

{ #category : 'accessing' }
runImageTests >> imageType [

	^ stoneName ifNil: [ opts at: 'imageType' ifPresent: [:arg | imageType := arg ] ]
]

{ #category : 'accessing' }
runImageTests >> gemStoneId [

	^ gemStoneId ifNil: [ gemStoneId := self gemStoneVersion copyWithout: $. ]
]

{ #category : 'accessing' }
runImageTests >> gemStoneVersion [

	^ gemStoneVersion ifNil: [ 
			opts at: 'gemStoneVersion' ifPresent: [:arg | gemStoneVersion := arg ] ]
]

{ #category : 'accessing' }
runImageTests >> stoneName [

	^ stoneName ifNil: [ opts at: 'stoneName' ifPresent: [:arg | stoneName := arg ] ]
]

{ #category : 'accessing' }
runImageTests >> sessionDescription [

	^ sessionDescription ifNil: [
		sessionDescription := 
			('$GS_HOME/sys/local/sessions/', self stoneName) asFileReference 
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
										--stoneName=<stone-name> --imageType=GLASS|GLASS1|TODE \
										--gemStoneVersion=<gemstone-version> \
										[ -- <startTopaz-specific-options> ]
DESCRIPTION

	`--stoneName` is the name of the stone in which to run the tests.

	`--imageType` is the type of image (GLASS, GLASS1,TODE) used as a base for build.

	`--gemStoneVersion` is the version of GemStone where the original script came from prior to upgrade.
	3.2.15, 3.3.9, and 3.4.3 are the currently tested versions.

EXAMPLES
	runImageTests.st --help
	runImageTests.st -h
	runImageTests.st -h -- myStone -lq

	runImageTests.st --stoneName=battery_339 imageType=GLASS gemStoneVersion=3.3.9
') printString, dashes
]
