extends Panel


onready var Billy = owner.get_node("Ground/Renderer/Billy")


# warning-ignore:unused_argument
func _physics_process(delta) -> void:
	$Debug.text = "Input: %s" % Globals.Controller.get_encoded_inputs()
