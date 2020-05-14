extends "res://Classes/StateMachine/State.gd"


func enter() -> void:
	#owner.velocity = Vector2.ZERO
	#owner.disable_hitboxes()
	owner.Flags.set_flag("is_in_motion", false)
	owner.Animations.play("Idle")
