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
