extends "res://Classes/Stage.gd"

var Fireball: PackedScene = preload("res://GameObjects/Bullets/Fireball/Fireball.tscn")


func _ready() -> void:
	$Camera.initialize()
	#Music.play_track(MUSIC)
	
	Cache.preload_resource("sound_sample", "woosh", "res://assets/audio/sounds/sf2_woosh.wav")
	Cache.preload_resource("sound_sample", "hadouken", "res://assets/audio/sounds/sf2_hadouken.wav")
	Cache.preload_resource("sound_sample", "punch", "res://assets/audio/sounds/sf2_punch.wav")
	Cache.preload_resource("sound_sample", "fireball", "res://assets/audio/sounds/sf2_hard_punch.wav")
	Cache.preload_resource("sound_sample", "kick", "res://assets/audio/sounds/sf2_kick.wav")
	Cache.preload_resource("sound_sample", "hit_metal", "res://assets/audio/sounds/sf2_hit_metal.wav")
	Cache.preload_resource("sound_sample", "destroyed_metal", "res://assets/audio/sounds/sf2_metal_destroyed.wav")
	
	$Controller.add_input("Up", "U")
	$Controller.add_input("Down", "D")
	$Controller.add_input("Left", "L")
	$Controller.add_input("Right", "R")
	$Controller.add_input("Jump", "J")
	$Controller.add_input("Kick", "K")
	$Controller.add_input("Punch", "P")
	$Controller.add_input("Special", "S")


func _process(_delta):
	OS.set_window_title("%s %s | fps: %s" % [Constants.PROJET_NAME, Constants.BUILT_VERSION, Engine.get_frames_per_second()])


func _input(event) -> void:
	if event.is_action_pressed("Spawn"):
		fireball()


func fireball() -> void:
	var bullet: Node2D = Fireball.instance()

	Globals.Renderer.add_child(bullet)

	bullet.initialize(1, get_global_mouse_position(), Vector2.ZERO)
