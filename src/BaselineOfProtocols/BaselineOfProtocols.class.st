Class {
	#name : #BaselineOfProtocols,
	#superclass : #BaselineOf,
	#category : #BaselineOfProtocols
}

{ #category : #baselines }
BaselineOfProtocols >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec package: 'Protocols' ]
]

{ #category : #accessing }
BaselineOfProtocols >> projectClass [
	^ MetacelloCypressBaselineProject
]
