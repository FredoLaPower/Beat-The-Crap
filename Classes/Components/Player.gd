#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name PlayerComponent
extends Node

#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

#------------------------------
# EXPORT
#------------------------------

export(NodePath) var HITBOXES


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# PUBLIC
#------------------------------

func initialize() -> void:
	pass


func disable_hitboxes(disable: bool = true) -> void:
	for hitbox in get_node(HITBOXES).get_children():
		if disable:
			hitbox.position = Vector2.ZERO

		hitbox.get_node("Collider").disabled = disable
