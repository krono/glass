testing
isActive
	^ (requestor isSelected: target)
		and: [target respondsTo: #browse]