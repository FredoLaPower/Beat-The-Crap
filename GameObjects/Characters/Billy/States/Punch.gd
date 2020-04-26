extends "res://Classes/State.gd"


func initialize() -> void:
	# warning-ignore:return_value_discarded
	owner.get_node("Pivot/Animation/AnimationPlayer").connect("animation_finished", self, "_on_animation_finished")


func enter() -> void:
	owner.play_sound("Punch")
	
	owner.get_node("Pivot/Animation/AnimationPlayer").play("Punch")
	owner.velocity = Vector2.ZERO


func _on_animation_finished(anim_name: String) -> void:
	if anim_name == "Punch":
		emit_signal("finished", "Previous")
