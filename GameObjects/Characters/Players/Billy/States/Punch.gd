extends "res://Classes/StateMachine/State.gd"


func initialize() -> void:
	# warning-ignore:return_value_discarded
	owner.get_node("Controllers/Animation").connect("animation_finished", self, "__on_animation_finished")


func enter() -> void:
	if owner.special_move("Hadouken"):
		emit_signal("finished", "Hadouken")
		return
	
	owner.set_flag("is_in_motion", false)
	owner.get_node("Controllers/Animation").play("Punch")


func __on_animation_finished(anim_name: String) -> void:
	if anim_name == "Punch":
		emit_signal("finished", "Previous")
