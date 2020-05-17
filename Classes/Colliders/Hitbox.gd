#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name Hitbox
extends Area2D


#------------------------------------------------------------
# SIGNALS
#------------------------------------------------------------

# warning-ignore:unused_signal
signal hit


#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

#------------------------------
# EXPORT
#------------------------------
export(NodePath) var THICKNESS
export(int) var DAMAGE
export(Constants.DAMAGE_TYPE) var DAMAGE_TYPE

#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# PUBLIC
#------------------------------

func get_thickness() -> int:
	return get_node(THICKNESS).THICKNESS


# warning-ignore:unused_argument
func callback(hit: bool) -> void:
	pass
