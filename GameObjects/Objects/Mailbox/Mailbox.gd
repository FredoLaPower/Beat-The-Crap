extends "res://Classes/Objects/Static/Destructible.gd"

func _ready() -> void:
	Cache.preload_resource("sound_sample", "hit_metal", "res://assets/audio/sounds/sf2_hit_metal.wav")
	Cache.preload_resource("sound_sample", "destroyed_metal", "res://assets/audio/sounds/sf2_metal_destroyed.wav")
	
	_current_health = HEALTH
	
	$Controllers/Animation.play(START_ANIMATION)


func take_damage(damage: int) -> void:
	_current_health -= damage
	
	$Controllers/Animation.stop()
	
	if _current_health  <= 0:
		$Controllers/Animation.play("Destroyed")
	else:
		if _current_health >= int(HEALTH / 2):
			$Controllers/Animation.play("Hit")
		else:
			$Controllers/Animation.play("Damaged")


func _on_Animation_animation_finished(anim_name):
	if anim_name == "Destroyed":
		queue_free()
