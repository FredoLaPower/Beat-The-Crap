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
	var bullet: Node2D = Fireball.new()
	var pos: Vector2 = Vector2.ZERO
	var offset: Vector2 = Vector2.ZERO
	var direction: int = 0
	
	if get_flag("is_looking_left"):
		pos.x = -$Pivot/BulletSpawnPoint.global_position.x
	else:
		pos.x = $Pivot/BulletSpawnPoint.global_position.x
	
	pos.y = owner.global_position.y
	offset.y = $Pivot/BulletSpawnPoint.global_position.y
	direction = -1 if get_flag("is_looking_left") else 1
	
	Globals.Renderer.add_child(bullet)
	
	bullet.spawn(direction, pos, offset)
