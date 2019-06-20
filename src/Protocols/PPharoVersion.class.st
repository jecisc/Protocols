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

{ #category : #initialization }
PPharoVersion >> initialize [
	super initialize.
	protocols := Set new
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
