message list
selectedMessage
  "Answer a copy of the source code for the selected message."

  | class selector method |
  contents == nil ifFalse: [^ contents copy].

  class := self selectedClassOrMetaClass.
  selector := self selectedMessageName.
  method := class compiledMethodAt: selector otherwise: nil .
  method ifNil: [^ ''].  "method deleted while in another project"
  currentCompiledMethod := method.

  ^ contents := (self showingDocumentation
    ifFalse: [ self sourceStringPrettifiedAndDiffed ]
    ifTrue: [ self commentContents ])
