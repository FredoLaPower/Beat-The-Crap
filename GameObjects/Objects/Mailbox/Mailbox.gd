extends "res://Classes/DestructibleObject.gd"


# warning-ignore:unused_argument
func _process(delta):
	if _current_state == "Destroyed":
		return
