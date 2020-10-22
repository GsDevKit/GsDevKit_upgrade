prepare image user
prepareImageUser_patches
	"Needed for installing GsdevKit/GLASS - should be run as Seaside User"

	self patch_Behavior_primitiveCompileMethod: #'*core'