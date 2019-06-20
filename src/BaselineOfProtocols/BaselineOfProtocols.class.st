Class {
	#name : #BaselineOfProtocols,
	#superclass : #BaselineOf,
	#category : #BaselineOfProtocols
}

{ #category : #baselines }
BaselineOfProtocols >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ self gitBridge: spec.
			spec package: 'Protocols' with: [ spec requires: #('GitBridge') ] ]
]

{ #category : #dependencies }
BaselineOfProtocols >> gitBridge: spec [
	spec baseline: 'GitBridge' with: [ spec repository: 'github://jecisc/GitBridge/src' ]
]

{ #category : #accessing }
BaselineOfProtocols >> projectClass [
	^ MetacelloCypressBaselineProject
]
