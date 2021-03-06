*squeak-enumerating
detectMax: aBlock
	"Evaluate aBlock with each of the receiver's elements as the argument. 
	Answer the element for which aBlock evaluates to the highest magnitude.
	If collection empty, return nil.  This method might also be called elect:."

	| maxElement maxValue val |
	1 to: self size do: [:i | | each |
		each := self at: i.
		maxValue == nil
			ifFalse: [
				val _ aBlock value: each.
				(val notNil and: [ (val _ aBlock value: each) > maxValue ]) ifTrue: [
					maxElement _ each.
					maxValue _ val]]
			ifTrue: ["first element"
				maxElement _ each.
				maxValue _ aBlock value: each].
				"Note that there is no way to get the first element that works 
				for all kinds of Collections.  Must test every one."].
	^ maxElement