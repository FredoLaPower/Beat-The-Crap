extends Node2D


func _ready():
	MusicManager.disallow_mixed_resources()
	MusicManager.set_resource_path("res://Resources/Audio/Musics/")
	
	MusicManager.add_track("SSD_Intro.ogg")
	MusicManager.add_track("SSD_Mission_1.ogg")
	MusicManager.add_track("SSD_Mission_2.ogg")
	MusicManager.add_track("SSD_Mission_3.ogg")
	MusicManager.add_track("SSD_Mission_4.ogg")
	MusicManager.add_track("SSD_Mission_5.ogg")
	MusicManager.add_track("SSD_Mission_6.ogg")
	MusicManager.add_track("SSD_Outro.ogg")


func _on_Pause_pressed():
	if MusicManager.get_state() == "Paused":
		MusicManager.unpause()
	else:
		MusicManager.pause()
	
	$Title.text = "Title : " +MusicManager.current_track()
	$State.text = "State : " + MusicManager.get_state()

func _on_Previous_pressed():
	MusicManager.previous_track()
	
	$Title.text = "Title : " +MusicManager.current_track()
	$State.text = "State : " + MusicManager.get_state()

func _on_Next_pressed():
	MusicManager.next_track()

	$Title.text = "Title : " +MusicManager.current_track()
	$State.text = "State : " + MusicManager.get_state()

func _on_Play_pressed():
	MusicManager.listen_to_tracklist()
	
	$Title.text = "Title : " +MusicManager.current_track()
	$State.text = "State : " + MusicManager.get_state()
