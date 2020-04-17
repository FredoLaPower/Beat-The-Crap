extends "res://Classes/State.gd"

func input(event):
	if event.is_action_pressed("ui_right"):
		emit_signal("finished", "Walk")
	
	elif event.is_action_pressed("ui_jump"):
		emit_signal("finished", "Jump")

func enter():
	owner.get_node("Animations/AnimationPlayer").play("Idle")
