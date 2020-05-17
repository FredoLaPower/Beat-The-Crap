#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name MoveComponent
extends Node


#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

#------------------------------
# EXPORT
#------------------------------

export(NodePath) var BODY
export(NodePath) var WRAPPER
export(NodePath) var FLAGS
export(Vector2) var MAX_SPEED = Vector2(0, 0)


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

# warning-ignore:unused_argument
func _physics_process(delta: float) -> void:
	if !get_node(FLAGS).get_flag("is_in_motion"):
		velocity = lerp(velocity, Vector2.ZERO, Constants.MOTION_ACCELERATION)
	
	velocity = get_node(BODY).move_and_slide(velocity, Vector2.UP)


#------------------------------
# PUBLIC
#------------------------------
func initialize() -> void:
	get_node(FLAGS).add_flag("is_in_motion", false)
	get_node(FLAGS).add_flag("is_looking_left", false)
	get_node(FLAGS).add_flag("is_looking_up", false)


func flip(axis: String, direction: int) -> void:
	for child in get_node(WRAPPER).get_children():
		match axis:
			"x":
				child.scale.x = direction
			"y":
				child.scale.Y = direction
