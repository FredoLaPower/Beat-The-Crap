extends "res://Classes/Objects/Kinematic/Bullet.gd"

func __initialize() -> void:
	Animations.play("Fire")


func _on_Animation_animation_finished(anim_name):
	if anim_name == "Explode":
		_release = true
