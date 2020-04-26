extends "res://Classes/Character.gd"


func _initialize() -> void:
	_add_sound("Punch", "res://assets/audio/sounds/woosh.wav")
	_add_sound("Kick", "res://assets/audio/sounds/woosh.wav")

func disable_hitboxes() -> void:
	$Pivot/Boxes/Punch/PunchCollider.disabled = true
	$Pivot/Boxes/Kick/KickCollider.disabled = true
