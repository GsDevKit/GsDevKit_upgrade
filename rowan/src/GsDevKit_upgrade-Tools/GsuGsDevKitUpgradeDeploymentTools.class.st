Class {
	#name : 'GsuGsDevKitUpgradeDeploymentTools',
	#superclass : 'RwProjectTool',
	#category : 'GsDevKit_upgrade-Tools'
}

{ #category : 'private' }
GsuGsDevKitUpgradeDeploymentTools >> _defaultDeploySpecName [

	^  'GsDevKit_upgrade_deploy.ston'
]

{ #category : 'private' }
GsuGsDevKitUpgradeDeploymentTools >> _defaultTopazFileHeader: fileName [

	^ (WriteStream on: String new)
		nextPutAll: '!========================================================================='; lf;
		nextPutAll: '! Copyright (C) GemTalk Systems 2019.  All Rights Reserved.'; lf;
		nextPutAll: '! MIT license: see https://github.com/GsDevKit/GsDevKit_upgrade/blob/master/LICENSE'; lf;
		nextPutAll: '!'; lf;
		nextPutAll: '! Name - ', fileName, '.gs'; lf;
		nextPutAll: '!'; lf;
		nextPutAll: '! Purpose:'; lf;
		nextPutAll: '! Bootstrap GsDevKit_upgrade into a 3.x database to perform GsDevKit upgade operations.'; lf;
		nextPutAll: '!'; lf;
		nextPutAll: '!======================================================================='; lf;
		contents
]

{ #category : 'private' }
GsuGsDevKitUpgradeDeploymentTools >> _projectDefinitionFor: specName [
	| projectRoot specUrlString projectDefinition packageNameToPlatformPropertiesMap |

	projectRoot := self _projectsHome / self _projectName.
	specUrlString :=  'file:' , projectRoot fullName,  '/rowan/specs/', specName.
	projectDefinition := RwComponentProjectDefinition newForUrl: specUrlString.
	projectDefinition projectHome: self _projectsHome.
	Rowan projectTools read 
		readProjectSetForComponentProjectDefinition: projectDefinition.
	packageNameToPlatformPropertiesMap := projectDefinition projectRef packageNameToPlatformPropertiesMap.
	projectDefinition packageNames do: [:packageName |
		| dict |
		dict := Dictionary new 
			at: 'symbolDictName' 
				put: 'GsDevKit_Upgrade_SymDict_private'; 
			yourself.
		packageNameToPlatformPropertiesMap at: packageName put:dict ].
	^ projectDefinition
		packageFormat: 'filetree';
		projectHome: self _projectsHome;
		yourself
]

{ #category : 'private' }
GsuGsDevKitUpgradeDeploymentTools >> _projectName [

	^ 'GsDevKit_upgrade'
]

{ #category : 'private' }
GsuGsDevKitUpgradeDeploymentTools >> _projectSetFor: specName [

	^ (RwProjectSetDefinition new)
		addProject: (self _projectDefinitionFor: specName);
		yourself.
]

{ #category : 'private' }
GsuGsDevKitUpgradeDeploymentTools >> _projectsHome [

	^ FileSystem disk / '$GS_HOME/shared/repos'
]

{ #category : 'filetree' }
GsuGsDevKitUpgradeDeploymentTools >> deployFiletreeRepository [

	^ self deployFiletreeRepository: 'filetree' specName: self _defaultDeploySpecName
]

{ #category : 'filetree' }
GsuGsDevKitUpgradeDeploymentTools >> deployFiletreeRepository: deploymentName specName: specName [

	| projectDefinition projectSetDefinition visitor deploymentDir projectSetModification |
	projectDefinition := self _projectDefinitionFor: specName.
	projectDefinition
		packagesPath: deploymentName;
		yourself.
	deploymentDir := self _projectsHome / self _projectName/ 'filetree'.
	deploymentDir ensureCreateDirectory.
	projectSetDefinition :=  (RwProjectSetDefinition new)
		addProject: projectDefinition;
		yourself.
	projectSetModification := projectSetDefinition compareAgainstBase: RwProjectSetDefinition new.
	visitor := RwModificationFiletreeWriterVisitor new.
	visitor visit: projectSetModification.
]

{ #category : 'topaz' }
GsuGsDevKitUpgradeDeploymentTools >> deployTopazFilein [

	^ self deployTopazFilein: self _projectName spec: self _defaultDeploySpecName
]

{ #category : 'topaz' }
GsuGsDevKitUpgradeDeploymentTools >> deployTopazFilein: topazFileName spec: specName [

	self 
		deployTopazFilein: topazFileName 
		topazFileHeader: (self _defaultTopazFileHeader: topazFileName)
		spec: specName
]

{ #category : 'topaz' }
GsuGsDevKitUpgradeDeploymentTools >> deployTopazFilein: topazFileName topazFileHeader: topazFileHeader spec: specName [

	| projectSetDefinition visitor deploymentDir projectSetModification |
	projectSetDefinition := self _projectSetFor: specName.

	deploymentDir := self _projectsHome / self _projectName/ 'gemstone'.
	deploymentDir ensureCreateDirectory.
	projectSetModification := projectSetDefinition compareAgainstBase: RwProjectSetDefinition new.
	visitor := RwGsModificationTopazWriterVisitor new
		repositoryRootPath: deploymentDir;
		topazFilename: topazFileName;
		topazFileHeader: topazFileHeader;
		yourself.
	visitor visit: projectSetModification.
]
