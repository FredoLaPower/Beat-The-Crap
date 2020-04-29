extends "res://Classes/Bullet.gd"

func __initialize() -> void:
	__add_sound("Explode", "res://assets/audio/sounds/sf2_hard_punch.wav")
	
	$Pivot/AnimationPlayer.play("Fire")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Explode":
		queue_free()
