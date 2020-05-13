extends "res://Classes/Hurtbox.gd"


func __area_entered_callback():
	if owner._current_health  <= 0:
		owner.get_node("Managers/Animation").play("Destroyed")
	else:
		if owner._current_health >= int(owner.HEALTH / 2):
			owner.get_node("Managers/Animation").play("Hit")
		else:
			owner.get_node("Managers/Animation").play("Damaged")
