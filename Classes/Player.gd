#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name Player

extends "res://Classes/KinematicObject.gd"

#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

#------------------------------
# EXPORT
#------------------------------

export(Vector2) var MAX_SPEED = Vector2(0, 0)
export(int) var JUMP_FORCE = 0


#------------------------------
# PRIVATE
#------------------------------

var _special_moves = {}


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# VIRTUAL
#------------------------------

# warning-ignore:unused_argument
func _physics_process(delta: float) -> void:
	if !get_flag("is_on_floor"):
		$Container.velocity.y += Constants.GRAVITY * delta
	
	if !get_flag("is_in_motion"):
		velocity = lerp(velocity, Vector2.ZERO, Constants.MOTION_ACCELERATION)
	
	._physics_process(delta)


#------------------------------
# PRIVATE
#------------------------------

func __add_special_move(name: String, signature: String) -> void:
	_special_moves[name] = signature


#------------------------------
# PUBLIC
#------------------------------

func special_move(name: String) -> bool:
	var input_strings: Array = _special_moves[name].split("||")
	
	for input_string in input_strings:
		if Globals.Controller.get_encoded_inputs().find(input_string) != -1:
			return true

	return false
