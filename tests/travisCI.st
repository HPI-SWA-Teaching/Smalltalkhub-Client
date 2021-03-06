| gitPath gitCache |
Transcript cr; show: 'travis---->travisCI.st'.

gitCache := 'git_cache'.
gitPath := (Smalltalk at: #'FileDirectory' ifAbsent: [  ])
  ifNil: [ ((Smalltalk at: #'FileSystem') workingDirectory / gitCache) pathString ]
  ifNotNil: [:fileDirectoryClass | (fileDirectoryClass default directoryNamed: gitCache ) fullName].

Metacello new
  baseline: 'Project04';
  repository: 'filetree://', gitPath, '/Smalltalkhub-Client/packages';
  get.

Metacello new
  baseline: 'Project04';
  repository: 'filetree://', gitPath, '/Smalltalkhub-Client/packages';
  load: 'TravisCI'.

"Install WebClient"
Metacello new
  configuration: 'WebClient';
  load.

"Run the tests"
TravisCIHarness
  value: #( 'BaselineOfProject04' )
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.
