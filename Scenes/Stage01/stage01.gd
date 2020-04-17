extends Node2D


func _ready():
	MusicController.allow_mixed_resources()
	MusicController.play_track("res://assets/audio/musics/super_double_dragon/mission_2.ogg")
