extends "res://Classes/Character.gd"

var Fireball: PackedScene = preload("res://GameObjects/Bullets/Fireball/Fireball.tscn")

func __initialize() -> void:
	__add_sound("Punch", "res://assets/audio/sounds/sf2_woosh.wav")
	__add_sound("Kick", "res://assets/audio/sounds/sf2_woosh.wav")
	__add_sound("Hadouken", "res://assets/audio/sounds/sf2_hadouken.wav")
	
	__add_special_move("Hadouken", "DRP||DLP")


func disable_hitboxes() -> void:
	$Pivot/Boxes/Punch/PunchCollider.disabled = true
	$Pivot/Boxes/Kick/KickCollider.disabled = true

func special_move(name: String) -> bool:
	var input_strings: Array = _special_moves[name].split("||")
	
	for input_string in input_strings:
		if input_string == $Controller.get_encoded_inputs():
			return true
	
	return false

func fire_bullet(type: String) -> void:
	var bullet: KinematicBody2D = null
	
	match type:
		"fireball":
			bullet = Fireball.instance()
		
	add_child(bullet)
	
	bullet.position = $Pivot/BulletSpawnPoint.position
	
	if get_flag("is_looking_left"):
		bullet.position.x = -$Pivot/BulletSpawnPoint.position.x
		
	bullet.get_node("Pivot/Range").position.y = - $Pivot/BulletSpawnPoint.position.y
	
	bullet.fire(get_flag("is_looking_left"))
