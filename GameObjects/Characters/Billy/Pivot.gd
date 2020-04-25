extends KinematicBody2D


var velocity: Vector2 = Vector2.ZERO


# warning-ignore:unused_argument
func _physics_process(delta):
	velocity = move_and_slide(velocity, Vector2.UP)
