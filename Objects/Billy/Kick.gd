extends "res://Classes/State.gd"

func initialize():
	get_node(ANIMATION_PLAYER).connect("animation_finished", self, "_on_animation_finished")


func enter():
	get_node(ANIMATION_PLAYER).play("Kick")
	owner.velocity = Vector2.ZERO


func _on_animation_finished(anim_name):
	if anim_name == "Kick":
		emit_signal("finished", "Previous")
