extends "res://Classes/DestructibleObject.gd"

func __initialize() -> void:
	__add_sound("Hit", "res://assets/audio/sounds/sf2_hit_metal.wav")
	__add_sound("Destroyed", "res://assets/audio/sounds/sf2_metal_destroyed.wav")



func _on_Animation_animation_finished(anim_name):
	if anim_name == "Destroyed":
		call_deferred("queue_free")
