extends "res://Classes/State.gd"

func initialize() -> void:
# warning-ignore:return_value_discarded
	get_node(ANIMATION_PLAYER).connect("animation_finished", self, "_on_animation_finished")


func enter() -> void:
	get_node(ANIMATION_PLAYER).play("Punch")
	owner.velocity = Vector2.ZERO

func _on_animation_finished(anim_name: String) -> void:
	if anim_name == "Punch":
		emit_signal("finished", "Previous")
