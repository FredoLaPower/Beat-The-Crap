extends Panel


onready var Billy = owner.get_node("Ground/Renderer/Billy")


# warning-ignore:unused_argument
func _physics_process(delta) -> void:
	$Stack.text = "Looking left? %s\nIs on floor? %s\nId: %s" % [Billy.get_flag("is_looking_left"), Billy.get_flag("is_on_floor"), Billy.get_instance_id()]
	
