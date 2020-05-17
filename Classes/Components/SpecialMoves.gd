#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name SpecialMovesComponent
extends Node


#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

#------------------------------
# PRIVATE
#------------------------------

var _special_moves: Dictionary = {}


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# PRIVATE
#------------------------------

func __add_special_move(name: String, signature: String) -> void:
	_special_moves[name] = signature


#------------------------------
# PUBLIC
#------------------------------

func initialize() -> void:
	pass


func special_move(name: String) -> bool:
	var input_strings: Array = _special_moves[name].split("||")
	
	for input_string in input_strings:
		if Globals.Controller.get_encoded_inputs().find(input_string) != -1:
			return true

	return false
