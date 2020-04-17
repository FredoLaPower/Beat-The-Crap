extends "res://Classes/State.gd"

func enter():
	owner.get_node("Animations/AnimationPlayer").play("Jump")

func _input(event):
	if event.is_action_released("ui_jump"):
		emit_signal("finished", "Idle")
