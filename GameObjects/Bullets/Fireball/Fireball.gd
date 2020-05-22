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
export(NodePath) var FLAGS

#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# PUBLIC
#------------------------------

func initialize(direction: int, pos: Vector2, offset: Vector2) -> void:
	print(direction)
	get_node(BODY).position = pos
	get_node(WRAPPER).position = offset
	get_node(MOVE).flip(direction)
	print(get_node(FLAGS).get_flag("is_looking_left"))
