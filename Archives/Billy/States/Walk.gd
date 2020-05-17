#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

extends "res://Classes/StateMachine/State.gd"


#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

#------------------------------
# EXPORT
#------------------------------

export(NodePath) var FLAGS
export(NodePath) var ANIMATIONS
export(NodePath) var MOVE
export(NodePath) var PLAYER


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# PUBLIC
#------------------------------

func enter() -> void:
	get_node(PLAYER).disable_hitboxes()
	get_node(FLAGS).set_flag("is_in_motion", true)
	get_node(ANIMATIONS).play("Walk")


# warning-ignore:unused_argument
func update(delta: float):
	var x_input = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	var y_input = Input.get_action_strength("Up") - Input.get_action_strength("Down")
	
	get_node(MOVE).velocity.x = lerp(get_node(MOVE).velocity.x, x_input * get_node(MOVE).MAX_SPEED.x, Constants.MOTION_ACCELERATION)
	get_node(MOVE).velocity.y = lerp(get_node(MOVE).velocity.y, -y_input * get_node(MOVE).MAX_SPEED.y, Constants.MOTION_ACCELERATION)
	
	if x_input < 0 && !get_node(FLAGS).get_flag("is_looking_left"):
		get_node(FLAGS).set_flag("is_looking_left", true)
		get_node(MOVE).flip("x", -1)
	elif x_input > 0 && get_node(FLAGS).get_flag("is_looking_left"):
		get_node(FLAGS).set_flag("is_looking_left", false)
		get_node(MOVE).flip("x", 1)
	
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
