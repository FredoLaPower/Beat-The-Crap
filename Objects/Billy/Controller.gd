extends "res://Classes/FiniteStateMachine.gd"


func _ready():
	__add_state("Idle", $Idle)
	__add_state("Walk", $Walk)
	__add_state("Jump", $Jump)
	
	__initialize()
