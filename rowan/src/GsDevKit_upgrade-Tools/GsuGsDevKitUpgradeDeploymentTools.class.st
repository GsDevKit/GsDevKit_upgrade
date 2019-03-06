Class {
	#name : 'GsuGsDevKitUpgradeDeploymentTools',
	#superclass : 'RwProjectTool',
	#category : 'GsDevKit_upgrade-Tools'
}

{ #category : 'filetree' }
GsuGsDevKitUpgradeDeploymentTools >> deployFiletreeFilein [
]

{ #category : 'topaz' }
GsuGsDevKitUpgradeDeploymentTools >> deployTopazFilein [

	^ self deployTopazFilein: 'GsDevKit_upgrade' spec: 'GsDevKit_upgrade_v2.0.ston'
]

{ #category : 'topaz' }
GsuGsDevKitUpgradeDeploymentTools >> deployTopazFilein: topazFileName spec: specName [

	| 	projectSetDefinition visitor repositoryRootPath projectsHome projectRoot specUrlString projectDefinition projectSetModification |

	projectsHome := FileSystem disk / '$GS_HOME/shared/repos'.
	projectRoot := projectsHome / 'GsDevKit_upgrade'.
	specUrlString :=  'file:' , projectRoot fullName,  '/rowan/specs/', specName.
	projectDefinition := RwComponentProjectDefinition newForUrl: specUrlString.
	projectDefinition projectHome: projectsHome.
	Rowan projectTools read 
		readProjectSetForComponentProjectDefinition: projectDefinition.
	projectSetDefinition := (RwProjectSetDefinition new)
		addProject: projectDefinition;
		yourself.

	repositoryRootPath := projectRoot / 'gemstone'.
	repositoryRootPath ensureCreateDirectory.
	projectSetModification := projectSetDefinition compareAgainstBase: RwProjectSetDefinition new.
	visitor := RwGsModificationTopazWriterVisitor new
		repositoryRootPath: repositoryRootPath;
		topazFilename: topazFileName;
		yourself.
	visitor visit: projectSetModification.
]
