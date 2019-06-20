Class {
	#name : #MethodsInfoReader,
	#superclass : #Object,
	#instVars : [
		'version'
	],
	#classVars : [
		'Cache'
	],
	#category : #'Protocols-Utils'
}

{ #category : #actions }
MethodsInfoReader class >> cachedVersions [
	^ Cache ifNil: [ Cache := self readAll ]
]

{ #category : #actions }
MethodsInfoReader class >> on: aFileReference [
	^ self new on: aFileReference
]

{ #category : #actions }
MethodsInfoReader class >> readAll [
	^ ProtocolsBridge methodsResources files collect: [ :file | self on: file ]
]

{ #category : #actions }
MethodsInfoReader class >> resetCache [
	Cache := nil
]

{ #category : #reading }
MethodsInfoReader >> on: aFileReference [
	version := PPharoVersion new.
	version version: (String with: (aFileReference basename at: 13)) asInteger.
	self resolveProtocolsFrom: aFileReference.
	^ version
]

{ #category : #reading }
MethodsInfoReader >> resolveProtocolsFrom: aFileReference [
	| methods |
	methods := aFileReference
		readStreamDo: [ :s | 
			(NeoCSVReader on: s)
				recordClass: PMethod;
				addField: #selector:;
				addField: #protocol:;
				addField: #methodClass:;
				addField: #package:;
				readHeader;
				upToEnd ].
	(methods groupedBy: #protocol)
		keysAndValuesDo: [ :protocol :mets | 
			version
				addProtocol:
					(PProtocol new
						name: protocol;
						methods: mets;
						yourself) ]
]
