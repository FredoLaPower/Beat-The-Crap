extends "res://Classes/Player.gd"

var Fireball: PackedScene = preload("res://GameObjects/Bullets/Fireball/Fireball.tscn")

func __initialize() -> void:
	__add_flag("is_looking_left", false)
	__add_flag("is_on_floor", true)
	
	Cache.preload_resource("sound_sample", "woosh", "res://assets/audio/sounds/sf2_woosh.wav")
	Cache.preload_resource("sound_sample", "hadouken", "res://assets/audio/sounds/sf2_hadouken.wav")
	
	__add_special_move("Hadouken", "DRP||DLP")
	
	disable_hitboxes()


func fireball() -> void:
	var bullet: Node2D = Fireball.instance()
	var pos: Vector2 = Vector2.ZERO
	var offset: Vector2 = Vector2.ZERO
	var direction: int = 0
	
	pos.x = $Container/SpawnPoints/Fireball.global_position.x
	pos.y = global_position.y
	offset.y = $Container/SpawnPoints/Fireball.position.y #relative position from Billy's origin (same offset)
	direction = -1 if get_flag("is_looking_left") else 1
	
	Globals.Renderer.add_child(bullet)
	
	bullet.spawn(direction, pos, offset)
