extends "res://Classes/State.gd"


func enter() -> void:
	owner.get_node("Pivot/Animation/AnimationPlayer").play("Walk")


# warning-ignore:unused_argument
func update(delta: float):
	var x_input = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	var y_input = Input.get_action_strength("Up") - Input.get_action_strength("Down")
	
	owner.velocity.x = x_input * owner.MAX_SPEED.x
	owner.velocity.y = -y_input * owner.MAX_SPEED.y
	
	if x_input < 0:
		owner.flip_character(true)
	elif x_input > 0:
		owner.flip_character(false)
	
	if x_input == 0 && y_input == 0:
		emit_signal("finished","Idle")


func handle_input(event: InputEvent)  -> void:
	if event.get_action_strength("Jump"):
		emit_signal("finished", "Jump", true)
	
	if event.get_action_strength("Punch"):
		emit_signal("finished", "Punch", true)
		return
	
	if event.get_action_strength("Kick"):
		emit_signal("finished", "Kick", true)
		return
