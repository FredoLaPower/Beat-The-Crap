extends Area2D


# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Hurtbox_area_shape_entered(area_id, area, area_shape, self_shape):
	if owner._threats.find(area.get_owner().get_instance_id()) != -1:
		print("Hit by: %s of %s" % [area.get_name(), area.get_owner().get_name()])
		owner.get_node("AnimationPlayer").play("Damaged")
