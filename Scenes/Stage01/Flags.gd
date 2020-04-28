extends Panel


onready var Billy = owner.get_node("Ground/Renderer/Billy")


# warning-ignore:unused_argument
func _physics_process(delta) -> void:
	$Stack.text = "Inputs string: %s" % [Billy.get_node("Controller").get_encoded_inputs()]
	
