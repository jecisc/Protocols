Class {
	#name : #ProtocolsScripts,
	#superclass : #Object,
	#category : #'Protocols-Utils'
}

{ #category : #scripts }
ProtocolsScripts class >> exportInfos [
	<script>
	| methods protocols |
	methods := (Smalltalk globals allClasses flatCollect: #methods) groupedBy: #protocol.
	protocols := Dictionary new.
	Smalltalk globals allClasses do: [ :class | class protocols do: [ :protocol | protocols at: protocol ifPresent: [ :num | protocols at: protocol put: num + 1 ] ifAbsent: [ protocols at: protocol put: 1 ] ] ].

	('protocolsPharo' , SystemVersion current major asString , '.csv') asFileReference
		ensureDelete;
		ensureCreateFile;
		writeStreamDo: [ :s | 
			s
				<< 'Name,NumberOfMethodsInIt,NumberOfClassesUsingTheProtocol';
				lf.
			protocols
				keysAndValuesDo: [ :protocol :classesUsing | 
					protocol first = $*
						ifFalse: [ s
								<< '"';
								<< protocol;
								<< '","';
								<< (methods at: protocol) size asString;
								<< '","';
								<< classesUsing asString;
								<< '"';
								lf ] ] ]
]

{ #category : #scripts }
ProtocolsScripts class >> exportInfos2 [
	<script>
	SystemVersion current major < 3
		ifFalse: [ ('methodsPharo' , SystemVersion current major asString , '.csv') asFileReference
				ensureDelete;
				ensureCreateFile;
				writeStreamDo: [ :s | 
					s
						<< 'selector,protocol,class,package';
						lf.
					(Smalltalk globals allClasses flatCollect: #methods)
						do: [ :method | 
							(s << '"' << method selector << '","' << method protocol << '","' << method methodClass name << '","' << method methodClass package name)
								<< '"';
								lf ] ] ]
		ifTrue: [ ('methodsPharo' , SystemVersion current major asString , '.csv') asFileReference
				ensureDeleted;
				ensureFile;
				writeStreamDo: [ :s | 
					s
						<< 'selector,protocol,class,package';
						lf.
					(Smalltalk globals allClasses collect: #methods)
						do: [ :methods | 
							methods
								do: [ :method | 
									(s << '"' << method selector << '","' << method protocol << '","' << method methodClass name << '","' << method methodClass package name)
										<< '"';
										lf ] ] ] ]
]

{ #category : #'as yet unclassified' }
ProtocolsScripts class >> script1 [
	| versions p7 lessUsed mostUsed possibleTypos |
	versions := MethodsInfoReader cachedVersions.

	p7 := versions detect: [ :e | e version = 7 ].

	lessUsed := p7 nonExtensionProtocols select: [ :e | e classes size < 5 ].
	mostUsed := p7 nonExtensionProtocols select: [ :e | e classes size > 20 ].

	lessUsed size.	"2163"
	mostUsed size.	"93"

	possibleTypos := Dictionary new.
	lessUsed do: [ :proto | (mostUsed select: [ :p | (proto name levenshteinDistanceWith: p name) < 2 ]) ifNotEmpty: [ :potentialCorrections | possibleTypos at: proto put: potentialCorrections ] ].
	possibleTypos size.
	String
		streamContents: [ :s | 
			possibleTypos
				keysAndValuesDo: [ :k :v | 
					s
						<< k name;
						tab: 4.
					v do: [ :p | s << p name ] separatedBy: [ s << ', ' ].
					s lf ] ]
]
