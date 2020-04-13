extends Control

# Switch to the other scene
func _on_GoToScene1Button_pressed():
	get_tree().change_scene("res://Scene1.tscn")

# Load and play track 2
func _on_PlayTrack2Button_pressed():
	MusicController.play("res://tracks/Le Grand Chase (track 2).ogg")
