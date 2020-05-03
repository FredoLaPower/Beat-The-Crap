extends Panel


onready var Billy = owner.get_node("Ground/Renderer/Billy")


# warning-ignore:unused_argument
func _physics_process(delta) -> void:
	if Billy.get_threats().size() > 0:
		$Stack.text = "Threats: %s" % Billy.get_threats()
	else:
		$Stack.text = "Safe..."
	
