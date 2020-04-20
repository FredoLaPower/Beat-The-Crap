extends Panel


onready var Billy = owner.get_node("Ground/Billy")


func _ready() -> void:
	Billy.get_node("Controller").connect("state_changed", self, "_on_Controller_state_changed")

func _on_Controller_state_changed(_new_state: String) -> void:
	var index = -1
	var stack = Billy.get_node("Controller").get_states_stack()
	
	$Stack.text = ""
	
	for state in stack:
		index += 1
		$Stack.text += str(index) + ". " + state + "\n"
