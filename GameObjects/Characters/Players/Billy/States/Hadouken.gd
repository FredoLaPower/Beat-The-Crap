extends "res://Classes/StateMachine/State.gd"


func initialize() -> void:
	# warning-ignore:return_value_discarded
	owner.Animations.connect("animation_finished", self, "__on_animation_finished")


func enter() -> void:
	owner.velocity = Vector2.ZERO
	
	owner.Flags.set_flag("is_in_motion", false)
	owner.Animations.play("Hadouken")
	owner.fireball()

func __on_animation_finished(anim_name: String) -> void:
	if anim_name == "Hadouken":
		emit_signal("finished", "Previous")
