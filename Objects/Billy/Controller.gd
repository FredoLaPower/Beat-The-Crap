extends "res://Classes/FiniteStateMachine.gd"


func _ready():
	__add_state("Idle", $Idle)
	__add_state("Walk", $Walk)
	__add_state("Jump", $Jump)
	__add_state("Punch", $Punch)
	__add_state("Kick", $Kick)
	
	__initialize()
