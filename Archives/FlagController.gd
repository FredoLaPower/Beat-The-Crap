#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name FlagController
extends Node


#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

#------------------------------
# PRIVATE
#------------------------------

var _flags: Dictionary = {}


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# PUBLIC
#------------------------------

func add_flag(name: String, value: bool) -> void:
	_flags[name] = value


func get_flag(flag_name: String) -> bool:
	return _flags[flag_name]

func get_flag_dictionnary() -> Dictionary:
	return _flags

func set_flag(flag_name: String, value: bool) -> void:
	_flags[flag_name] = value
