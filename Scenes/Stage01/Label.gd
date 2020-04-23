extends Label


func _process(_delta):
	text = "%s fps" % Engine.get_frames_per_second() 
