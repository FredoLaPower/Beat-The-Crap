#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name Character
extends "res://Classes/Objects/Kinematic/Kinematic.gd"

#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

#------------------------------
# EXPORT
#------------------------------

export(Vector2) var MAX_SPEED = Vector2(0, 0)
export(int) var JUMP_FORCE = 0
export(int) var HEALTH


#------------------------------
# PRIVATE
#------------------------------

var _current_health = 0


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# VIRTUAL
#------------------------------

func _physics_process(delta: float) -> void:
	if !Flags.get_flag("is_in_motion"):
		velocity = lerp(velocity, Vector2.ZERO, Constants.MOTION_ACCELERATION)
	
	._physics_process(delta)


#------------------------------
# PUBLIC
#------------------------------

func get_health() -> int:
	return _current_health


func get_max_health() -> int:
	return HEALTH
