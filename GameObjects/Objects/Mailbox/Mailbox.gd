extends "res://Classes/Destructible.gd"

func _ready() -> void:
	Cache.preload_resource("sound_sample", "hit_metal", "res://assets/audio/sounds/sf2_hit_metal.wav")
	Cache.preload_resource("sound_sample", "destroyed_metal", "res://assets/audio/sounds/sf2_metal_destroyed.wav")
	
	_current_health = HEALTH
	
	$Managers/Animation.play(START_ANIMATION)


func _on_Animation_animation_finished(anim_name):
	if anim_name == "Destroyed":
		queue_free()
