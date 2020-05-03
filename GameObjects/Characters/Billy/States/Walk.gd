extends "res://Classes/State.gd"


func enter() -> void:
	owner.disable_hitboxes()
	owner.set_flag("is_in_motion", true)
	owner.get_node("Managers/Animation").play("Walk")


# warning-ignore:unused_argument
func update(delta: float):
	var x_input = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	var y_input = Input.get_action_strength("Up") - Input.get_action_strength("Down")
	
	owner.velocity.x = lerp(owner.velocity.x, x_input * owner.MAX_SPEED.x, Constants.MOTION_ACCELERATION)
	owner.velocity.y = lerp(owner.velocity.y, -y_input * owner.MAX_SPEED.y, Constants.MOTION_ACCELERATION)
	
	if x_input < 0 && !owner.get_flag("is_looking_left"):
		owner.set_flag("is_looking_left", true)
		owner.flip_object("x", -1)
	elif x_input > 0 && owner.get_flag("is_looking_left"):
		owner.set_flag("is_looking_left", false)
		owner.flip_object("x", 1)
	
	if x_input == 0 && y_input == 0:
		emit_signal("finished","Idle")


func handle_input(event: InputEvent)  -> void:
	if event.is_action_pressed("Jump"):
		emit_signal("finished", "Jump", true)
	
	if event.is_action_pressed("Punch"):
		emit_signal("finished", "Punch", true)
		return
	
	if event.is_action_pressed("Kick"):
		emit_signal("finished", "Kick", true)
		return

	if event.is_action_pressed("Special"):
		emit_signal("finished", "Combo", true)
		return
