extends "res://Classes/Stage.gd"

func _ready() -> void:
	$Camera.initialize()
	#MusicController.play_track(MUSIC)


func _on_Area2D_body_entered(_body):
	print("hit me harder bitch")
