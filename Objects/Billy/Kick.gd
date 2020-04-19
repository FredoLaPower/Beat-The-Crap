extends "res://Classes/State.gd"

func initialize():
	get_parent().AnimationPlayer.connect("animation_finished", self, "_on_animation_finished")


func enter():
	get_parent().AnimationPlayer.play("Kick")
	owner.velocity = Vector2.ZERO


func _on_animation_finished(anim_name):
	if anim_name == "Kick":
		emit_signal("finished", "Previous")
