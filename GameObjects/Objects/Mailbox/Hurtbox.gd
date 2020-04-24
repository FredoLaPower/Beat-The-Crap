extends Area2D


# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Hurtbox_area_shape_entered(area_id, area, area_shape, self_shape):
	owner.get_node("AnimationPlayer").play("Destroyed")
