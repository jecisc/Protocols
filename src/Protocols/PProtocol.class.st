Class {
	#name : #PProtocol,
	#superclass : #Object,
	#instVars : [
		'name',
		'methods'
	],
	#category : #'Protocols-Model'
}

{ #category : #initialization }
PProtocol >> initialize [
	super initialize.
	methods := Set new
]

{ #category : #accessing }
PProtocol >> methods [
	^ methods
]

{ #category : #accessing }
PProtocol >> methods: anObject [
	methods := anObject
]

{ #category : #accessing }
PProtocol >> name [
	^ name
]

{ #category : #accessing }
PProtocol >> name: anObject [
	name := anObject
]
