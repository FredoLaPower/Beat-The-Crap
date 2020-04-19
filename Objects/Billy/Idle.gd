extends "res://Classes/State.gd"

func enter():
	get_parent().AnimPlayer.play("Idle")
	owner.velocity = Vector2.ZERO


func handle_input(event):
	if event.is_action_pressed("ui_left") || event.is_action_pressed("ui_right") || event.is_action_pressed("ui_up") || event.is_action_pressed("ui_down"):
		emit_signal("finished", "Walk")
		return
	
	if event.is_action_pressed("ui_jump"):
		emit_signal("finished", "Jump", true)
		return
	
	if event.is_action_pressed("ui_punch"):
		emit_signal("finished", "Punch", true)
		return
	
	if event.is_action_pressed("ui_kick"):
		emit_signal("finished", "Kick", true)
		return
