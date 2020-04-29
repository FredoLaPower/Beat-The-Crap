extends "res://Classes/StateMachine.gd"


func _ready() -> void:
	__add_state("Idle", $Idle)
	__add_state("Walk", $Walk)
	__add_state("Jump", $Jump)
	__add_state("Punch", $Punch)
	__add_state("Kick", $Kick)
	__add_state("Hadouken", $Hadouken)
	
	__add_input("Up", "U")
	__add_input("Down", "D")
	__add_input("Left", "L")
	__add_input("Right", "R")
	__add_input("Jump", "J")
	__add_input("Kick", "K")
	__add_input("Punch", "P")
