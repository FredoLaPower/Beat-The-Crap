#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name Hitbox
extends Area2D


#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

#------------------------------
# EXPORT
#------------------------------
export(NodePath) var THICKNESS
export(int) var DAMAGE
export(String) var SOUND


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# PUBLIC
#------------------------------

func get_thickness() -> int:
	return get_node(THICKNESS).THICKNESS
