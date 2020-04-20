extends "res://Classes/Stage.gd"

func _ready() -> void:
	$Camera.initialize()
	MusicController.play_track(MUSIC)
