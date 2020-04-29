extends "res://Classes/State.gd"


func initialize() -> void:
	# warning-ignore:return_value_discarded
	owner.get_node("Pivot/Animation/AnimationPlayer").connect("animation_finished", self, "__on_animation_finished")


func enter() -> void:
	owner.play_sound("Hadouken")
	owner.get_node("Pivot/Animation/AnimationPlayer").play("Hadouken")
	
	owner.velocity = Vector2.ZERO
	
	owner.fire_bullet("fireball")

func __on_animation_finished(anim_name: String) -> void:
	if anim_name == "Hadouken":
		emit_signal("finished", "Previous")
