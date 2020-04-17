extends Node2D

func _ready():
	$Controller.connect("state_changed", self, "_on_Controller_state_changed")


func _on_Controller_state_changed(new_state):
	$State.text = new_state
	$Stack.text = ""
	
	var stack = $Controller.get_states_stack()
	
	for state in stack:
		$Stack.text += state + '\n'
