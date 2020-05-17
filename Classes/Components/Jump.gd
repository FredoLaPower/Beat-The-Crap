#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name JumpComponent
extends Node


#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

#------------------------------
# EXPORT
#------------------------------

export(NodePath) var WRAPPER
export(NodePath) var FLAGS
export(int) var JUMP_FORCE


#------------------------------
# PUBLIC
#------------------------------

var velocity: Vector2 = Vector2.ZERO


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# VIRTUAL
#------------------------------

func _physics_process(delta: float) -> void:
	if !get_node(FLAGS).get_flag("is_on_floor"):
		velocity.y += Constants.GRAVITY * delta
		velocity = get_node(WRAPPER).move_and_slide(velocity, Vector2.UP)


#------------------------------
# PUBLIC
#------------------------------

func initialize() -> void:
	get_node(FLAGS).add_flag("is_on_floor", true)
