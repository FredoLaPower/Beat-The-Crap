#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name Destructible
extends "res://Classes/Objects/Static/Static.gd"


#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

#------------------------------
# EXPORT
#------------------------------

export(String) var START_ANIMATION
export(int) var HEALTH


#------------------------------
# PRIVATE
#------------------------------

var _current_health = 0


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# PUBLIC
#------------------------------

# warning-ignore:unused_argument
func take_damage(damage: int) -> void:
	pass


func get_health() -> int:
	return _current_health


func get_max_health() -> int:
	return HEALTH
