Class {
	#name : #PPharoVersion,
	#superclass : #Object,
	#instVars : [
		'version',
		'protocols'
	],
	#category : #'Protocols-Model'
}

{ #category : #adding }
PPharoVersion >> addProtocol: aPProtocol [ 
	self protocols add: aPProtocol
]

{ #category : #accessing }
PPharoVersion >> classes [
	^ self protocols flatCollect: #classes as: Set
]

{ #category : #accessing }
PPharoVersion >> extensionProtocols [
	^ self protocols select: #isExtension
]

{ #category : #initialization }
PPharoVersion >> initialize [
	super initialize.
	protocols := Set new
]

{ #category : #accessing }
PPharoVersion >> methods [
	^ self protocols flatCollect: #methods as: Set
]

{ #category : #accessing }
PPharoVersion >> nonExtensionProtocols [
	^ self protocols reject: #isExtension
]

{ #category : #accessing }
PPharoVersion >> packages [
	^ self protocols flatCollect: #packages as: Set
]

{ #category : #printing }
PPharoVersion >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPut: $[;
		print: version;
		nextPutAll: '](';
		print: protocols size;
		nextPut: $)
]

{ #category : #accessing }
PPharoVersion >> protocols [
	^ protocols
]

{ #category : #accessing }
PPharoVersion >> protocols: anObject [
	protocols := anObject
]

{ #category : #accessing }
PPharoVersion >> version [
	^ version
]

{ #category : #accessing }
PPharoVersion >> version: anObject [
	version := anObject
]
