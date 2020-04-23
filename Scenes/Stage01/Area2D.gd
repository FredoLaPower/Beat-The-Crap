extends Area2D


# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Area2D_area_shape_entered(area_id, area, area_shape, self_shape):
	print("hit me harder bitch: %s" % area_id)
