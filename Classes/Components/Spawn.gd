#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name SpawnComponent
extends Node


#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

#------------------------------
# EXPORT
#------------------------------

export(PackedScene) var SCENE


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# PUBLIC
#------------------------------

func spawn(direction: int, pos: Vector2, offset: Vector2) -> void:
	var object = SCENE.instance()
	
	object.initialize(direction, pos, offset)
	
	Globals.Renderer.add_child(object)
