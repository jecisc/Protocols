# Protocols

## API

```Smalltalk
MethodsInfoReader resetCache.
versions := MethodsInfoReader cachedVersions.

p7 := versions detect: [ :e | e version = 7 ].
p6 := versions detect: [ :e | e version = 6 ].

p7 protocols size. "2896"
p7 extensionProtocols size. "311"
p7 nonExtensionProtocols size. "2585"
p7 methods size. "92629"
p7 classes size. "6927"
p7 packages size. "521"

accessing := p7 protocols detect: [ :e | e name = 'accessing' ].
accessing methods size. "19122"
accessing classes size. "3680"
accessing packages size. "384"

newProtocols := p7 newProtocolsSince: p6.
newProtocols size. "455"
(newProtocols reject: #isExtension) size. "362"

removedProtocols := p7 removedProtocolsSince: p6.
removedProtocols size. "344"
(removedProtocols reject: #isExtension) size. "287"
```

# Ideas

- Extend Calypso to show protocols with `-` separator as tree.
