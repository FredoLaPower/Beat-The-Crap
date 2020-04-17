extends "res://Classes/FiniteStateMachine.gd"


func _ready():
	__add_state("Idle", $Idle)
	__add_state("Walk", $Walk)
	__add_state("Jump", $Jump)
	
	__initialize()
	
	for child in get_children():
		child.connect("finished", self, "__change_state")
