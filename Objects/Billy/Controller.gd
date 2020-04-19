extends "res://Classes/FiniteStateMachine.gd"

func _ready():
	_is_in_debug_mode = false
	
#	__listen_input("ui_left")
#	__listen_input("ui_up")
#	__listen_input("ui_right")
#	__listen_input("ui_down")
#	__listen_input("ui_jump")
#	__listen_input("ui_punch")
#	__listen_input("ui_kick")
#
#	__debug("input")
	
	__add_state("Idle", $Idle)
	__add_state("Walk", $Walk)
	__add_state("Jump", $Jump)
	__add_state("Punch", $Punch)
	__add_state("Kick", $Kick)
