extends "res://Classes/StateMachine.gd"


func _ready() -> void:
	__add_state("Idle", $Idle)
	__add_state("Walk", $Walk)
	__add_state("Jump", $Jump)
	__add_state("Punch", $Punch)
	__add_state("Kick", $Kick)
	
	__add_input("Up", "released")
	__add_input("Down", "released")
	__add_input("Left", "released")
	__add_input("Right", "released")
	__add_input("Jump", "released")
	__add_input("Kick", "released")
	__add_input("Punch", "released")
