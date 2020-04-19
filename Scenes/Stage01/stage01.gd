extends "res://Classes/Stage.gd"

func _ready():
	MusicController.allow_mixed_resources()
	MusicController.play_track(MUSIC)
