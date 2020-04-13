extends Node2D


func _ready():
	MusicController.disallow_mixed_resources()
	MusicController.set_resource_path("res://Resources/Audio/Musics/")
	
	MusicController.add_track("SSD_Intro.ogg")
	MusicController.add_track("SSD_Mission_1.ogg")
	MusicController.add_track("SSD_Mission_2.ogg")
	MusicController.add_track("SSD_Mission_3.ogg")
	MusicController.add_track("SSD_Mission_4.ogg")
	MusicController.add_track("SSD_Mission_5.ogg")
	MusicController.add_track("SSD_Mission_6.ogg")
	MusicController.add_track("SSD_Outro.ogg")


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
