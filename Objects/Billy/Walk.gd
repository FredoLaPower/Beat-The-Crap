extends "res://Classes/State.gd"


func enter() -> void:
	get_node(ANIMATION_PLAYER).play("Walk")


func update(_delta: float):
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var y_input = Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down")
	
	owner.velocity.x = x_input * owner.MAX_SPEED.x
	owner.velocity.y = -y_input * owner.MAX_SPEED.y
	
	if x_input < 0:
		owner.flip_character(true)
	elif x_input > 0:
		owner.flip_character(false)
	
	if x_input == 0 && y_input == 0:
		emit_signal("finished","Idle")


func handle_input(event: InputEvent)  -> void:
	if event.get_action_strength("ui_jump"):
		emit_signal("finished", "Jump", true)
	
	if event.get_action_strength("ui_punch"):
		emit_signal("finished", "Punch", true)
		return
	
	if event.get_action_strength("ui_kick"):
		emit_signal("finished", "Kick", true)
		return
