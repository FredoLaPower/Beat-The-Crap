#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

extends "res://Classes/GameObject.gd"


#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

#------------------------------
# EXPORT
#------------------------------

export(NodePath) var BODY
export(NodePath) var WRAPPER
export(NodePath) var THICKNESS
export(NodePath) var MOVE


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# PUBLIC
#------------------------------

func initialize(direction: int, pos: Vector2, offset: Vector2) -> void:
	get_node(BODY).position = pos
	get_node(WRAPPER).position = offset
	get_node(MOVE).flip("x", direction)
