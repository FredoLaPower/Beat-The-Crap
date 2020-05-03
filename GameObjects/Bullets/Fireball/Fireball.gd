extends "res://Classes/Bullet.gd"

func __initialize() -> void:
	__add_sound("Explode", "res://assets/audio/sounds/sf2_hard_punch.wav")
	$Managers/Animation.play("Fire")


func enable_hitbox() -> void:
	$Container/Colliders/Hitboxes/Impact/Collider.disabled = false


func disable_hitbox() -> void:
	$Container/Colliders/Hitboxes/Impact/Collider.disabled = true


func _on_Animation_animation_finished(anim_name):
	if anim_name == "Explode":
		_release = true
		print("released by animplayer")
