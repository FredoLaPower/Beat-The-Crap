extends "res://Classes/State.gd"


func enter() -> void:
	owner.get_node("Pivot/Animation/AnimationPlayer").play("Walk")
