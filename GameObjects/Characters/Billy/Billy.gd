extends "res://Classes/Character.gd"


func __initialize() -> void:
	__add_sound("Punch", "res://assets/audio/sounds/woosh.wav")
	__add_sound("Kick", "res://assets/audio/sounds/woosh.wav")
	
	__add_move("Hadoken", "LDRP")


func disable_hitboxes() -> void:
	$Pivot/Boxes/Punch/PunchCollider.disabled = true
	$Pivot/Boxes/Kick/KickCollider.disabled = true
