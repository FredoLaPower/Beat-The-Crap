extends "res://Classes/State.gd"


func initialize() -> void:
	# warning-ignore:return_value_discarded
	owner.get_node("Managers/Animation").connect("animation_finished", self, "__on_animation_finished")


func enter() -> void:
	owner.set_flag("is_in_motion", false)
	owner.get_node("Managers/Animation").play("Kick")


func __on_animation_finished(anim_name: String) -> void:
	if anim_name == "Kick":
		emit_signal("finished", "Previous")
