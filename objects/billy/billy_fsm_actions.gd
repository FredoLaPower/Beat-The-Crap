extends "res://classes/finite_state_machine.gd"


func _ready():
	add_state("None")
	add_state("Punch")
	add_state("Kick")
	add_state("Shoot")
	add_state("Swing")
	
	call_deferred("set_state", states.None)
	call_deferred("set_target", owner)


#func _get_transition(delta):
#	return null
#
#
#func _enter_state(new_state, old_state):
#	pass
#
#
#func _exit_state(old_state, new_state):
#	pass
