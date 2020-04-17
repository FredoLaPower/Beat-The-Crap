# class_name  MusicController

extends AudioStreamPlayer

#------------------------------------------------------------
# PRIVATE MEMBERS
#------------------------------------------------------------


var _tracklist = []   # Array of resource path strings
var _current_track = 0    # Index in arrays starts from 0
var _resource_path = ""   # Common path where all the files are stored (optional if _mixed_resources = truer)
var _mixed_resources = true # If mixed resources is set to true both _resource_path and _file_extension will be ignored
var _state = "Stopped"
var _bus = ""


func _ready():
	autoplay = false
	stream_paused = false
	playing = false

#------------------------------------------------------------
# METHODS
#------------------------------------------------------------


#------------------------------
# Config
#------------------------------
func set_resource_path(resource_path: String):
	if _mixed_resources:
		push_warning("MusicController::set_resource_path() -> Mixed resources is set to true.")
	
	if resource_path.empty():
		push_error("MusicController::set_resource_path() -> Resource path can't be null.")
		return
		
	var directory = Directory.new();
	
	if not directory.dir_exists(resource_path):
		push_error("MusicController::set_resource_path() -> Directory not found: " + resource_path)
		return
	
	_resource_path = resource_path


func allow_mixed_resources():
	_mixed_resources = true


func disallow_mixed_resources():
	_mixed_resources = false


func set_bus(bus_name: String):
	_bus = bus_name
	bus = bus


#------------------------------
# Play controls
#------------------------------
func play_track(resource_path: String, add_resource_path: bool = false):
	if resource_path.empty():
		push_error("MusicController::play_track() -> Resource path can't be null.")
		return
	
	var path = ""
	
	if add_resource_path:
		path = _resource_path + resource_path
	else:
		path = resource_path
	
	if not File.new().file_exists(path):
		push_error("MusicController::play_track() -> File not found: " + path)
		return
	
	var track = load(path) 
	stream = track
	
	if _state == "Paused":
		stream_paused = false
	
	_state = "Playing"
	
	play()


func stop_track():
	_state = "Stopped"
	
	stop()


func pause():
	stream_paused = true
	_state = "Paused"


func unpause():
	stream_paused = false
	_state = "Unpaused"


#------------------------------
# Volume control
#------------------------------
func set_volume(value: float):
	if value < 0 or value > 100:
		push_error("MusicController::set_volume() -> Volumne must be in range of 0 to 100.")
		return
	
	volume_db = round(value * 0.8) - 80


func get_volume() -> int:
		var volume = round((80 - volume_db) / 0.8)
		return volume


#------------------------------
# Playlist Management
#------------------------------
func add_track(resource_path: String):
	if resource_path.empty():
		push_error("MusicController::add_track() -> Resource path can't be null.")
		return
	
	var path = ""
	
	if _mixed_resources:
		path = resource_path
	else:
		path = _resource_path + resource_path
	
	_tracklist.append(path)


func remove_track(resource_path: String):
	if resource_path.empty():
		push_error("MusicController::remove_track() -> Resource path can't be null.")
		return
	
	var path = ""
	
	if _mixed_resources:
		path = resource_path
	else:
		path = _resource_path + resource_path
		
	var index = _tracklist.find(path)

	if index == -1:
		push_error("MusicController::remove_track() -> Track not found. " + path)
		return
	
	_tracklist.remove(index)


func clear_tracklist():
	_tracklist.clear()


#------------------------------
# Playlist controls
#------------------------------
func play_track_number(number: int):
	if number < 0 or number > _tracklist.size():
		push_error("MusicController::play_track_number() -> Track number is outside of the tracklist boundaries.")
		return
	
	_current_track = number
	
	listen_to_tracklist()


func listen_to_tracklist():
	if _tracklist.size() == 0:
		push_error("MusicController::play_tracklist() -> tracklist is empty.")
		return
	play_track(_tracklist[_current_track])


func next_track(autoplay = true):
	_current_track += 1
	
	if _current_track > _tracklist.size() - 1:
		_current_track = 0
	
	if autoplay:
		listen_to_tracklist()


func previous_track(autoplay = true):
	_current_track -= 1
	
	if _current_track < 0:
		_current_track = _tracklist.size() - 1
	
	if autoplay:
		listen_to_tracklist()


func find_track(search_string):
	if search_string.empty():
		push_error("MusicController::find_track() -> Search term can't be null.")
		return -1
	
	for index in range(0,_tracklist.size() - 1):
		if not _tracklist[index].find(search_string) == -1:
			return index
	
	return -1


#------------------------------
# Display
#------------------------------
func get_state():
	return _state


func current_track():
	return _tracklist[_current_track]


func number_of_tracks():
	return _tracklist.size() + 1

func get_tracklist():
	return _tracklist
