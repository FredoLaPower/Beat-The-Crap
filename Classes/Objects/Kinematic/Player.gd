#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name Player
extends "res://Classes/Objects/Kinematic/Character.gd"


#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

#------------------------------
# PRIVATE
#------------------------------

var _special_moves = {}


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
func disable_hitboxes(disable: bool = true) -> void:
	for hitbox in $Container/Colliders/Hitboxes.get_children():
		if disable:
			hitbox.position = Vector2.ZERO
		
		hitbox.get_node("Collider").disabled = disable


func special_move(name: String) -> bool:
	var input_strings: Array = _special_moves[name].split("||")
	
	for input_string in input_strings:
		if Globals.Controller.get_encoded_inputs().find(input_string) != -1:
			return true

	return false
