extends "res://Classes/StateMachine/State.gd"


func enter() -> void:
	#owner.velocity = Vector2.ZERO
	#owner.disable_hitboxes()
	owner.set_flag("is_in_motion", false)
	owner.get_node("Controllers/Animation").play("Idle")
