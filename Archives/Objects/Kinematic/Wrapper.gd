#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name Wrapper
extends KinematicBody2D


#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

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
	if !owner.Flags.get_flag("is_on_floor"):
		velocity.y += Constants.GRAVITY * delta
		velocity = move_and_slide(velocity, Vector2.UP)
