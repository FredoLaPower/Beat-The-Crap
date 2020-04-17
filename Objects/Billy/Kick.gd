extends "res://Classes/State.gd"

func _ready():
	owner.get_node("Animations/AnimationPlayer").connect("animation_finished", self, "_on_animation_finished")


func enter():
	owner.get_node("Animations/AnimationPlayer").play("Kick")


func _on_animation_finished(anim_name):
	if anim_name == "Kick":
		emit_signal("finished", "Previous")
