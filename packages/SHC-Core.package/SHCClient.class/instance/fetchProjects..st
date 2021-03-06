api-calls internal
fetchProjects: aUserName
	| result array request |
	request := SHCListProjectsRequest withWebClient: self webclient.
	request username: aUserName.
	result := request execute.
	
	result ifTrue: [array := WebUtils jsonDecode: (ReadStream on: request responseContent). 	^ array] ifFalse: [^ nil]