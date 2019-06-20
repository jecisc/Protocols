Class {
	#name : #PProtocol,
	#superclass : #Object,
	#instVars : [
		'name',
		'methods'
	],
	#category : #'Protocols-Model'
}

{ #category : #accessing }
PProtocol >> classes [
	^ self methods collect: #methodClass as: Set
]

{ #category : #testing }
PProtocol >> isExtension [
	^ self name first = $*
]

{ #category : #accessing }
PProtocol >> methods [
	^ methods
]

{ #category : #accessing }
PProtocol >> methods: aCollection [
	methods := aCollection.
	aCollection do: [ :method | method protocol: self ]
]

{ #category : #accessing }
PProtocol >> name [
	^ name
]

{ #category : #accessing }
PProtocol >> name: anObject [
	name := anObject
]

{ #category : #accessing }
PProtocol >> packages [
	^ self methods collect: #package as: Set
]

{ #category : #printing }
PProtocol >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self name;
		nextPutAll: ')[';
		print: self methods size;
		nextPut: $]
]
