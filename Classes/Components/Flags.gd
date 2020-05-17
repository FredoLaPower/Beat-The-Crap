#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name FlagsComponent
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
# PRIVATE
#------------------------------

func __add_flag(name: String, value: bool) -> void:
	_flags[name] = value


#------------------------------
# PUBLIC
#------------------------------

func initialize() -> void:
	pass


func get_flag(flag_name: String) -> bool:
	return _flags[flag_name]


func set_flag(flag_name: String, value: bool) -> void:
	_flags[flag_name] = value


func get_dictionnary() -> Dictionary:
	return _flags
