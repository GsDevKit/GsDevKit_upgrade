private
_projectSpecForBaseline: baselineClassName
	"Have to extract project spec from regsitry without sending messages, because methods may need to be recompiled"

	"should only apply when doing bootstrap loads"

	^ nil	"project spec will be calculated at load time"