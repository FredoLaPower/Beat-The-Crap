#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name SoundController
extends AudioStreamPlayer


func play_sound(name: String):
	stream = Cache.sound_samples[name]
	play()
