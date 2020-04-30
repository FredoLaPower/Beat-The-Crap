extends "res://Classes/Hitbox.gd"


# warning-ignore:unused_argument
func __callback():
	owner.stop_motion()
	owner.play_sound("Explode")
	owner.get_node("Managers/Animation").play("Explode")
