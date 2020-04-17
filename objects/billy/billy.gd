 extends Node2D

func _ready():
	# Subscribe to Controller signal
	$Controller.connect("state_changed", self, "_on_Controller_state_changed")


func _on_Controller_state_changed(new_state):
	$State.text = new_state
