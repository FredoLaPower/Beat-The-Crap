extends Node2D


func _ready():
	MusicController.disallow_mixed_resources()
	MusicController.set_resource_path("res://assets/audio/musics/super_double_dragons/")
	
	MusicController.add_track("intro.ogg")
	MusicController.add_track("mission_1.ogg")
	MusicController.add_track("mission_2.ogg")
	MusicController.add_track("mission_3.ogg")
	MusicController.add_track("mission_4.ogg")
	MusicController.add_track("mission_5.ogg")
	MusicController.add_track("mission_6.ogg")
	MusicController.add_track("outro.ogg")
	
	$HSlider.value = MusicController.get_volume()

func _on_Pause_pressed():
	if MusicController.get_state() == "Paused":
		MusicController.unpause()
	else:
		MusicController.pause()
	
	$Title.text = "Title : " +MusicController.current_track()
	$State.text = "State : " + MusicController.get_state()

func _on_Previous_pressed():
	MusicController.previous_track()
	
	$Title.text = "Title : " +MusicController.current_track()
	$State.text = "State : " + MusicController.get_state()

func _on_Next_pressed():
	MusicController.next_track()

	$Title.text = "Title : " +MusicController.current_track()
	$State.text = "State : " + MusicController.get_state()

func _on_Play_pressed():
	MusicController.listen_to_tracklist()
	
	$Title.text = "Title : " +MusicController.current_track()
	$State.text = "State : " + MusicController.get_state()


func _on_HSlider_value_changed(value):
	MusicController.set_volume(value)
