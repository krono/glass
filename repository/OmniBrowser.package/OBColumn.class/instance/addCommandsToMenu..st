commands
addCommandsToMenu: aMenu 
	| scan nodes |
	scan := self announce: OBNodeCommandScan.
	nodes := self hasSelection
				ifTrue: [{self parent. self selectedNode}]
				ifFalse: [{self parent}].
	scan 
		populateMenu: aMenu
		withNodes: nodes
		forRequestor: self