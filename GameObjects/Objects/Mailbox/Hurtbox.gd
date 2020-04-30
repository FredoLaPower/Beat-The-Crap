extends Area2D


func _on_Body_area_entered(area):
	if owner._threats.find(area.get_owner().get_instance_id()) != -1:
		owner._current_health -= area.get_damage()
		
		if owner._current_health  <= 0:
			owner.get_node("Managers/Animation").play("Destroyed")
			
			owner.play_sound("Destroyed")
		else:
			if owner._current_health >= int(owner.HEALTH / 2):
				owner.get_node("Managers/Animation").play("Hit")
			else:
				owner.get_node("Managers/Animation").play("Damaged")
			
			owner.play_sound("Hit")
		
		print("%s -> %s (%s dmg)" % [area.get_owner().get_name(), area.get_name(), area.get_damage()])
		print("%s -> %s / %s HP" % [owner.get_name(), owner._current_health, owner.HEALTH])
