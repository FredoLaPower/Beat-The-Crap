extends "res://Classes/State.gd"


func initialize() -> void:
	# warning-ignore:return_value_discarded
	owner.get_node("Managers/Animation").connect("animation_finished", self, "__on_animation_finished")


func enter() -> void:
	if owner.special_move("Hadouken"):
		emit_signal("finished", "Hadouken")
		return
	
	owner.get_node("Managers/Animation").play("Punch")
	
	owner.velocity = Vector2.ZERO


func __on_animation_finished(anim_name: String) -> void:
	if anim_name == "Punch":
		emit_signal("finished", "Previous")
