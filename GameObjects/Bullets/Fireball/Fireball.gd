extends "res://Classes/Bullet.gd"

func __initialize() -> void:
	__add_sound("Explode", "res://assets/audio/sounds/sf2_hard_punch.wav")
	$Managers/Animation.play("Fire")


func _on_Animation_animation_finished(anim_name):
	if anim_name == "Explode":
		_release = true


func _body_entered_callback() -> void:
	owner.get_node("").disabled = false
