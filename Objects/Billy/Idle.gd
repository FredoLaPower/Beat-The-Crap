extends "res://Classes/State.gd"

func input(event):
	if event.is_action_pressed("ui_right"):
		emit_signal("finished", "Walk")
		return
	
	if event.is_action_pressed("ui_jump"):
		emit_signal("finished", "Jump")
		return
	
	if event.is_action_pressed("ui_punch"):
		emit_signal("finished", "Punch")
		return
	
	if event.is_action_pressed("ui_kick"):
		emit_signal("finished", "Kick")
		return

func enter():
	owner.get_node("Animations/AnimationPlayer").play("Idle")
