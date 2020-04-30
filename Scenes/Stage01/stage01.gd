extends "res://Classes/Stage.gd"


func _ready() -> void:
	$Camera.initialize()
	#MusicController.play_track(MUSIC)


func _process(_delta):
	OS.set_window_title("%s %s | fps: %s" % [Constants.PROJET_NAME, Constants.BUILT_VERSION, Engine.get_frames_per_second()])
