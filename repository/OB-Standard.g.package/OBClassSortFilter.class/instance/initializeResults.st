private
initializeResults
	| i chain2 chain1 result max |
	order := SortedCollection sortBlock: 
					[:assoc1 :assoc2 | 
					result := nil.
					chain1 := assoc1 key.
					chain2 := assoc2 key.
					max := chain1 size min: chain2 size.
					i := 1.
					[result isNil and: [i <= max]] whileTrue: 
							[(chain1 at: i) = (chain2 at: i) 
								ifTrue: [i := i + 1]
								ifFalse: [result := (chain1 at: i) name < (chain2 at: i) name]].
					result isNil ifTrue: [chain1 size < chain2 size] ifFalse: [result]]