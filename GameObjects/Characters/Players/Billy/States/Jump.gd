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
export(NodePath) var WRAPPER
export(NodePath) var JUMP


#------------------------------
# PRIVATE
#------------------------------

var _start_position: float = 0
var _start_time: float = 0
var _is_kicking: bool = false
var _max_time: int = 600


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# PUBLIC
#------------------------------

func enter() -> void:
	_is_kicking = false
	_start_time = OS.get_ticks_msec()
	_start_position = get_node(WRAPPER).position.y
	get_node(JUMP).velocity.y = -get_node(JUMP).JUMP_FORCE
	
	get_node(FLAGS).set_flag("is_in_motion", false)
	get_node(FLAGS).set_flag("is_on_floor", false)
	get_node(ANIMATIONS).play("Jump")


# warning-ignore:unused_argument
func update(delta: float) -> void:
	if get_node(WRAPPER).position.y > _start_position:
		get_node(WRAPPER).position.y = _start_position
		get_node(JUMP).velocity = Vector2.ZERO
			
		get_node(FLAGS).set_flag("is_on_floor", true)
		
		emit_signal("finished", "Previous")


func handle_input(event) -> void:
	if !_is_kicking && OS.get_ticks_msec() - _start_time < _max_time && event.is_action_pressed("Kick"):
		_is_kicking = true
		
		get_node(ANIMATIONS).play("Flying_kick")
