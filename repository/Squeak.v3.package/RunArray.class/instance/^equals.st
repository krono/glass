accessing
= otherArray 
	"Test if all my elements are equal to those of otherArray"

	(otherArray isMemberOf: RunArray) ifFalse: [^ self hasEqualElements: otherArray].

	"Faster test between two RunArrays"
 	^ (runs hasEqualElements: otherArray runs)
		and: [values hasEqualElements: otherArray values]
