Class {
	#name : #ProtocolsScripts,
	#superclass : #Object,
	#category : #Protocols
}

{ #category : #scripts }
ProtocolsScripts class >> exportInfos [
	<script>
	| methods protocols |
	methods := (Smalltalk globals allClasses flatCollect: #methods) groupedBy: #protocol.
	protocols := Dictionary new.
	Smalltalk globals allClasses do: [ :class | class protocols do: [ :protocol | protocols at: protocol ifPresent: [ protocols at: protocol put: (protocols at: protocol) + 1 ] ifAbsentPut: 1 ] ].

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
