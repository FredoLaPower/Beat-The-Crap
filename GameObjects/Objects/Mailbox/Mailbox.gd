extends "res://Classes/Destructible.gd"

func _ready() -> void:
	Cache.preload_resource("sound_sample", "hit_metal", "res://assets/audio/sounds/sf2_hit_metal.wav")
	Cache.preload_resource("sound_sample", "destroyed_metal", "res://assets/audio/sounds/sf2_metal_destroyed.wav")
	
	_current_health = HEALTH
	
	$Managers/Animation.play(START_ANIMATION)


func take_damage(damage: int) -> void:
	_current_health -= damage
	
	if _current_health  <= 0:
		$Managers/Animation.play("Destroyed")
	else:
		if _current_health >= int(HEALTH / 2):
			$Managers/Animation.play("Hit")
		else:
			$Managers/Animation.play("Damaged")


func _on_Animation_animation_finished(anim_name):
	if anim_name == "Destroyed":
		queue_free()
