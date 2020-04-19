#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name Character

extends KinematicBody2D


#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

#------------------------------
# EXPORT
#------------------------------
export(Vector2) var MAX_SPEED = Vector2(0, 0)
export(int) var JUMP_FORCE = 0
export(NodePath) var SPRITE_SHEET

#------------------------------
# PRIVATE
#------------------------------
var _character_gravity: int = 0

#------------------------------
# PUBLIC
#------------------------------
var velocity: Vector2 = Vector2.ZERO
var direction: Vector2 = Vector2(1, 0)


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------
func _physics_process(delta):
	move_and_slide(velocity, Vector2.UP)

func _process(delta):
	get_node(SPRITE_SHEET).flip_h = (direction.x == -1)

#------------------------------
# PUBLIC
#------------------------------
func get_gravity():
	return _character_gravity
