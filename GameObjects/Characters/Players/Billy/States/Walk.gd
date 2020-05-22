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


#------------------------------
# PRIVATE
#------------------------------

var _direction:Vector2 = Vector2.ZERO


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
	_direction.x = int(Input.is_action_pressed("Right")) - int(Input.is_action_pressed("Left"))
	_direction.y = int(Input.is_action_pressed("Up")) - int(Input.is_action_pressed("Down"))
	
	if _direction.length() > 1: # _direction is a normalized vector as we use is_action_ressed instead of get_action_strength
		_direction *= Constants.DIAGONAL_MOTION_FACTOR
	
	if _direction.x < 0 && not get_node(FLAGS).get_flag("is_looking_left"):
		get_node(MOVE).flip(-1)
	elif _direction.x > 0 && get_node(FLAGS).get_flag("is_looking_left"):
		get_node(MOVE).flip(1)
	
	get_node(MOVE).velocity.x = lerp(get_node(MOVE).velocity.x, _direction.x * get_node(MOVE).MAX_SPEED.x, Constants.MOTION_ACCELERATION)
	get_node(MOVE).velocity.y = lerp(get_node(MOVE).velocity.y, -_direction.y * get_node(MOVE).MAX_SPEED.y, Constants.MOTION_ACCELERATION)
	
	if _direction == Vector2.ZERO:
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
