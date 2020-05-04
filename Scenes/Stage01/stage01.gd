extends "res://Classes/Stage.gd"


func _ready() -> void:
	$Camera.initialize()
	#Music.play_track(MUSIC)
	
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
