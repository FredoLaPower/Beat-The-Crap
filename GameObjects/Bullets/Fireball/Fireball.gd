extends "res://Classes/Objects/Kinematic/Bullet.gd"

func __initialize() -> void:
	Cache.preload_resource("sound_sample", "fireball_explosion", "res://assets/audio/sounds/sf2_hard_punch.wav")

	$Controllers/Animation.play("Fire")


func _on_Animation_animation_finished(anim_name):
	if anim_name == "Explode":
		_release = true
