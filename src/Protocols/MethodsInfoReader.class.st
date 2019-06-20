Class {
	#name : #MethodsInfoReader,
	#superclass : #Object,
	#instVars : [
		'version'
	],
	#category : #'Protocols-Utils'
}

{ #category : #actions }
MethodsInfoReader class >> on: aFileReference [
	^ self new on: aFileReference
]

{ #category : #actions }
MethodsInfoReader class >> readAll [
	^ ProtocolsBridge methodsResources files collect: [ :file | self on: file ]
]

{ #category : #'instance creation' }
MethodsInfoReader >> on: aFileReference [
	version := PPharoVersion new.
	version version: (String with: (aFileReference basename at: 13)) asInteger.
	1halt.
	^ version
]
