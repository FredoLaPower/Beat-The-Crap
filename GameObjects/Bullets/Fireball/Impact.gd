extends "res://Classes/Hitbox.gd"


# warning-ignore:unused_argument
func __area_entered_callback():
	owner.stop_motion()
	owner.get_node("Managers/Animation").play("Explode")
