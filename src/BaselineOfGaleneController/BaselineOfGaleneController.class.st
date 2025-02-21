Class {
	#name : #BaselineOfGaleneController,
	#superclass : #BaselineOf,
	#category : #BaselineOfGaleneController
}

{ #category : #loading }
BaselineOfGaleneController class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'GaleneController' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfGaleneController >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'GaleneController'
		]
]
