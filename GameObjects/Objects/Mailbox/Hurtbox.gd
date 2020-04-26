extends Area2D


# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Hurtbox_area_shape_entered(area_id, area, area_shape, self_shape):
	if owner._threats.find(area.get_owner().get_instance_id()) != -1:
		owner._current_health -= area.get_damage()
		
		if owner._current_health  <= 0:
			owner.get_node("Animations/AnimationPlayer").play("Destroyed")
		else:
			if owner._current_health >= int(owner.HEALTH / 2):
				owner.get_node("Animations/AnimationPlayer").play("Hit")
			else:
				owner.get_node("Animations/AnimationPlayer").play("Damaged")
		
		owner.get_node("SoundPlayer").stream = load("res://assets/audio/sounds/hit_metal.wav")
		owner.get_node("SoundPlayer").play()
		
		print("Hit by : %s of %s (-%s HP)\nHealth : %s / %s" % [area.get_name(), area.get_owner().get_name(), area.get_damage(), owner._current_health, owner.HEALTH])
