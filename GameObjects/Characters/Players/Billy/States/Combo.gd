extends "res://Classes/StateMachine/State.gd"


func initialize() -> void:
	# warning-ignore:return_value_discarded
	owner.get_node("Controllers/Animation").connect("animation_finished", self, "__on_animation_finished")


func enter() -> void:
	owner.velocity = Vector2.ZERO
	
	#owner.play_sound("Hadouken")
	owner.get_node("Controllers/Animation").play("Combo")

func __on_animation_finished(anim_name: String) -> void:
	if anim_name == "Combo":
		emit_signal("finished", "Previous")
