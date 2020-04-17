extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.play_track("res://assets/audio/musics/super_double_dragon/intro.ogg")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
