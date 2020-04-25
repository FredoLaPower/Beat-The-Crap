extends "res://Classes/State.gd"


func enter() -> void:
	owner.velocity = Vector2.ZERO
	owner.get_node("Pivot/Animation/AnimationPlayer").play("Idle")


# warning-ignore:unused_argument
func update(delta: float) -> void:
		var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		var y_input = Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down")
		
		if x_input != 0 || y_input != 0:
			emit_signal("finished", "Walk")
			return


func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_jump"):
		emit_signal("finished", "Jump", true)
		return
	
	if event.is_action_pressed("ui_punch"):
		emit_signal("finished", "Punch", true)
		return
	
	if event.is_action_pressed("ui_kick"):
		emit_signal("finished", "Kick", true)
		return
