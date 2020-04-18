extends "res://Classes/State.gd"

func _ready():
	owner.get_node("Animations/AnimationPlayer").connect("animation_finished", self, "_on_animation_finished")


func enter():
	owner.get_node("Animations/AnimationPlayer").play("Jump")


func update(delta):
	#appliquer la physique
	pass


func _on_animation_finished(anim_name):
	if anim_name == "Jump":
		emit_signal("finished", "Previous")
