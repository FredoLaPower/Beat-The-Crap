extends "res://classes/finite_state_machine.gd"

func _ready():
	add_state("Idle")
	add_state("Walk")
	add_state("Run")
	add_state("Jump")
	
	call_deferred("set_state", states.Idle)
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
