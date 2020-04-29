extends Area2D


# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Hitbox_area_shape_entered(area_id, area, area_shape, self_shape):
	#we need a raycast to see if player is on same plan
	owner.stop_motion()
	owner.play_sound("Explode")
	owner.get_node("Pivot/AnimationPlayer").play("Explode")
