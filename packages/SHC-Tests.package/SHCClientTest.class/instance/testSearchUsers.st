tests
testSearchUsers
	| result |
	result := self clientInstance searchUsers: 'ShcTestUser1'.
	self assert: (result size = 1).
	self assert: ((result at: 1) name = 'ShcTestUser1')