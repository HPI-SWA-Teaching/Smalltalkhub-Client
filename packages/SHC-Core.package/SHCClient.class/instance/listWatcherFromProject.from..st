api-calls
listWatcherFromProject: aProjectName from: aUserName
	| result array request |
	request := SHCProjectWatcherRequest withWebClient: self webclient.
	request username: aUserName.
	request projectname: aProjectName.
	result := request execute.
	
	result ifTrue: [array := WebUtils jsonDecode: (ReadStream on: request responseContent). 	^ array] ifFalse: [^ nil]