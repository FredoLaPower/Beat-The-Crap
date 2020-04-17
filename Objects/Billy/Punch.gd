extends "res://Classes/State.gd"

func _ready():
	owner.get_node("Animations/AnimationPlayer").connect("animation_finished", self, "_on_animation_finished")


func enter():
	owner.get_node("Animations/AnimationPlayer").play("Punch")


func _on_animation_finished(_anim_name):
	emit_signal("finished", "Idle")
