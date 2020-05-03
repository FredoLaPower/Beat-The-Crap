#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name Player

extends "res://Classes/GameObject.gd"

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
	
	._physics_process(delta)


#------------------------------
# PRIVATE
#------------------------------

func __add_special_move(name: String, signature: String) -> void:
	_special_moves[name] = signature


#------------------------------
# PUBLIC
#------------------------------

func flip_character(is_looking_left: bool) -> void:
	set_flag("is_looking_left", is_looking_left)
	
	$Container.set_rotation(0) # Fix a bug due to move and slide
	
	if is_looking_left:
		$Container.scale = Vector2(-1,1)
	else:
		$Container.scale = Vector2(1,1)


#func special_move(name: String) -> bool:
#	var input_strings: Array = _special_moves[name].split("||")
#
#	print(get_encoded_inputs())
#
#	for input_string in input_strings:
#		if get_encoded_inputs().find(input_string) != -1:
#			return true
#
#	return false
