reading
readFrom: aStreamOrFileName
	| stream name eocdPosition |
	stream := aStreamOrFileName isStream
		ifTrue: [
			name := aStreamOrFileName name. 
			aStreamOrFileName]
		ifFalse: [self error: 'from fileName not implemented yet'].
	stream binary.
	eocdPosition := self class findEndOfCentralDirectoryFrom: stream.
	eocdPosition <= 0 ifTrue: [self error: 'can''t find EOCD position'].
	self readEndOfCentralDirectoryFrom: stream.
	stream position: eocdPosition - centralDirectorySize.
	self readMembersFrom: stream named: name