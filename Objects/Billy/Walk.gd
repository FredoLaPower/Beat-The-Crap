extends "res://Classes/State.gd"


func enter():
	owner.get_node("Animations/AnimationPlayer").play("Walk")

func _input(event):
	if event.is_action_released("ui_right"):
		emit_signal("finished", "Idle")
