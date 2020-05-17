#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name GameObject
extends Node


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# VIRTUAL
#------------------------------

func _ready() -> void:
	for component in $Components.get_children():
		if component.has_method("initialize"):
			component.initialize()
