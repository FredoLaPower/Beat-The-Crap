extends "res://Classes/StateMachine/State.gd"


func enter() -> void:
	#owner.velocity = Vector2.ZERO
	owner.disable_hitboxes()
	owner.set_flag("is_in_motion", false)
	owner.get_node("Controllers/Animation").play("Idle")


# warning-ignore:unused_argument
func update(delta: float) -> void:
	var x_input = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	var y_input = Input.get_action_strength("Up") - Input.get_action_strength("Down")
	
	if x_input != 0 || y_input != 0:
		emit_signal("finished", "Walk")
		return


func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("Jump"):
		emit_signal("finished", "Jump", true)
		return
	
	if event.is_action_pressed("Punch"):
		emit_signal("finished", "Punch", true)
		return
	
	if event.is_action_pressed("Kick"):
		emit_signal("finished", "Kick", true)
		return
	
	if event.is_action_pressed("Special"):
		emit_signal("finished", "Combo", true)
		return
