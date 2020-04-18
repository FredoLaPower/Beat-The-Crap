extends "res://Classes/State.gd"

func enter():
	owner.get_node("Animations/AnimationPlayer").play("Idle")


func handle_input(event):
	if event.is_action_pressed("ui_right"):
		emit_signal("finished", "Walk")
		return
	
	if event.is_action_pressed("ui_jump"):
		emit_signal("finished", "sub_Jump")
		return
	
	if event.is_action_pressed("ui_punch"):
		emit_signal("finished", "sub_Punch")
		return
	
	if event.is_action_pressed("ui_kick"):
		emit_signal("finished", "sub_Kick")
		return
