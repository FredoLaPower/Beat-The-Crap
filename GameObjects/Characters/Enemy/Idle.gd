extends "res://Classes/State.gd"


func enter() -> void:
	owner.velocity = Vector2.ZERO
	owner.get_node("Pivot/Animation/AnimationPlayer").play("Idle")
