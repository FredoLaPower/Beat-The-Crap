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
export(int) var DAMAGE


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# PUBLIC
#------------------------------

func get_damage() -> int:
	return DAMAGE
