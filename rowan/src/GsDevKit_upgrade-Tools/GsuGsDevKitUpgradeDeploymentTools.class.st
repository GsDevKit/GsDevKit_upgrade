Class {
	#name : 'GsuGsDevKitUpgradeDeploymentTools',
	#superclass : 'RwProjectTool',
	#category : 'GsDevKit_upgrade-Tools'
}

{ #category : 'private' }
GsuGsDevKitUpgradeDeploymentTools >> _projectDefinitionFor: specName [
	| projectRoot specUrlString projectDefinition |

	projectRoot := self _projectsHome / self _projectName.
	specUrlString :=  'file:' , projectRoot fullName,  '/rowan/specs/', specName.
	projectDefinition := RwComponentProjectDefinition newForUrl: specUrlString.
	projectDefinition projectHome: self _projectsHome.
	Rowan projectTools read 
		readProjectSetForComponentProjectDefinition: projectDefinition.
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
		addProject: self _projectDefinitionFor: specName;
		yourself.
]

{ #category : 'private' }
GsuGsDevKitUpgradeDeploymentTools >> _projectsHome [

	^ FileSystem disk / '$GS_HOME/shared/repos'
]

{ #category : 'filetree' }
GsuGsDevKitUpgradeDeploymentTools >> deployFiletreeRepository [

	^ self deployFiletreeRepository: 'filetree' specName: 'GsDevKit_upgrade_v2.0.ston'
]

{ #category : 'filetree' }
GsuGsDevKitUpgradeDeploymentTools >> deployFiletreeRepository: deploymentName specName: specName [

	| projectDefinition projectSetDefinition visitor deploymentDir projectSetModification |
	projectDefinition := self _projectDefinitionFor: specName.
	projectDefinition
		packagesPath: deploymentName;
		yourself.
self halt.
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

	^ self deployTopazFilein: 'GsDevKit_upgrade' spec: 'GsDevKit_upgrade_v2.0.ston'
]

{ #category : 'topaz' }
GsuGsDevKitUpgradeDeploymentTools >> deployTopazFilein: topazFileName spec: specName [

	| projectSetDefinition visitor deploymentDir projectSetModification |
	projectSetDefinition := self _projectSetFor: specName.

	deploymentDir := self _projectsHome / self _projectName/ 'gemstone'.
	deploymentDir ensureCreateDirectory.
	projectSetModification := projectSetDefinition compareAgainstBase: RwProjectSetDefinition new.
	visitor := RwGsModificationTopazWriterVisitor new
		repositoryRootPath: deploymentDir;
		topazFilename: topazFileName;
		yourself.
	visitor visit: projectSetModification.
]
