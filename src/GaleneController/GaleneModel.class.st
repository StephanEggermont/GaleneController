Class {
	#name : #GaleneModel,
	#superclass : #Object,
	#instVars : [
		'root',
		'process'
	],
	#category : #'GaleneController-Core'
}

{ #category : #accessing }
GaleneModel class >> root: galeneRoot [ 
	^self new
		root: galeneRoot;
		yourself
]

{ #category : #'as yet unclassified' }
GaleneModel >> groups [
	^ (root / 'groups') asFileReference files collect: [:f | STON fromStream: f readStream]
]

{ #category : #'as yet unclassified' }
GaleneModel >> newProcess [
	process := GtSubprocessWithInMemoryOutput new.
	process shellCommand: './galene'.
	process workingDirectory: root.
	process terminateOnShutdown.
	^process
	
]

{ #category : #accessing }
GaleneModel >> process [
	^ process
]

{ #category : #accessing }
GaleneModel >> process: anObject [
	process := anObject
]

{ #category : #accessing }
GaleneModel >> root [
	^ root
]

{ #category : #accessing }
GaleneModel >> root: galeneRoot [ 
	root := galeneRoot
]

{ #category : #'as yet unclassified' }
GaleneModel >> start [
	process ifNil: [process := self newProcess].
	process isRunning ifFalse: [process run]
]

{ #category : #accessing }
GaleneModel >> stop [
	process ifNotNil: [process terminate]
]
