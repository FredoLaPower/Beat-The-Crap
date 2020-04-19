extends "res://Classes/State.gd"

func enter():
	get_parent().AnimationPlayer.play("Walk")


func update(delta):
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var y_input = Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down")
	
	owner.velocity.x = x_input * owner.MAX_SPEED.x
	owner.velocity.y = -y_input * owner.MAX_SPEED.y
	
	get_parent().SpriteSheet.flip_h = x_input < 0
	
	if x_input == 0 && y_input == 0:
		emit_signal("finished","Idle")


func handle_input(event):
	if event.is_action_pressed("ui_jump"):
		emit_signal("finished", "Jump", true)
	
	if event.is_action_pressed("ui_punch"):
		emit_signal("finished", "Punch", true)
		return
	
	if event.is_action_pressed("ui_kick"):
		emit_signal("finished", "Kick", true)
		return
