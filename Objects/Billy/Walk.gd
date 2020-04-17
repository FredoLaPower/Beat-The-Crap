extends "res://Classes/State.gd"


func state_enter():
	owner.get_node("Animations/AnimationPlayer").play("Walk")

func state_input(event):
	if event.is_action_released("ui_right"):
		emit_signal("finished", "Idle")
	
	if event.is_action_pressed("ui_jump"):
		emit_signal("finished", "sub_Jump")
