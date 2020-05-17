extends "res://Classes/Colliders/Hitbox.gd"


func __area_entered_callback() -> void:
	owner.stop_motion()
	owner.Animations.play("Explode")
