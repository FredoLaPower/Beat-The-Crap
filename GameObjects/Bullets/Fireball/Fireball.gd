extends "res://Classes/Bullet.gd"

func __initialize() -> void:
	__add_sound("Explode", "res://assets/audio/sounds/sf2_hard_punch.wav")
	disable_hitbox()
	$Pivot/AnimationPlayer.play("Fire")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Explode":
		queue_free()

func enable_hitbox() -> void:
	$Pivot/Hitbox/Collider.disabled = false


func disable_hitbox() -> void:
	$Pivot/Hitbox/Collider.disabled = true
