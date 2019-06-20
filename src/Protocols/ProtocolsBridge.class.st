Class {
	#name : #ProtocolsBridge,
	#superclass : #GitBridge,
	#category : #Protocols
}

{ #category : #accessing }
ProtocolsBridge class >> methodsResources [
	^ self resources / 'methods'
]

{ #category : #accessing }
ProtocolsBridge class >> resources [
	^ self root / 'resources'
]
