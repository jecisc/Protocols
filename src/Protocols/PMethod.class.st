Class {
	#name : #PMethod,
	#superclass : #Object,
	#instVars : [
		'selector',
		'protocol',
		'methodClass',
		'package'
	],
	#category : #'Protocols-Model'
}

{ #category : #accessing }
PMethod >> methodClass [
	^ methodClass
]

{ #category : #accessing }
PMethod >> methodClass: anObject [
	methodClass := anObject
]

{ #category : #accessing }
PMethod >> package [
	^ package
]

{ #category : #accessing }
PMethod >> package: anObject [
	package := anObject
]

{ #category : #accessing }
PMethod >> protocol [
	^ protocol
]

{ #category : #accessing }
PMethod >> protocol: anObject [
	protocol := anObject
]

{ #category : #accessing }
PMethod >> selector [
	^ selector
]

{ #category : #accessing }
PMethod >> selector: anObject [
	selector := anObject
]
