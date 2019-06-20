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
		do: [ self
				gitBridge: spec;
				neoCSV: spec.
			spec package: 'Protocols' with: [ spec requires: #('GitBridge' 'NeoCSV') ] ]
]

{ #category : #dependencies }
BaselineOfProtocols >> gitBridge: spec [
	spec
		baseline: 'GitBridge'
		with: [ spec
				repository: 'github://jecisc/GitBridge/src';
				loads: 'Minimal' ]
]

{ #category : #dependencies }
BaselineOfProtocols >> neoCSV: spec [
	spec
		baseline: 'NeoCSV'
		with: [ spec
				repository: 'github://svenvc/NeoCSV:v15/repository';
				loads: 'core' ]
]

{ #category : #accessing }
BaselineOfProtocols >> projectClass [
	^ MetacelloCypressBaselineProject
]
