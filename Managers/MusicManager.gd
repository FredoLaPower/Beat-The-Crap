extends AudioStreamPlayer2D


#Private members
var _playlist        = []   # Array of resource path strings
var _current_track   = 0    # Index in arrays starts from 0
var _resource_path   = ""   # Common path where all the files are stored (optional if _mixed_resources = truer)
var _mixed_resources = true # If mixed resources is set to true both _resource_path and _file_extension will be ignored
var _state           = "Stopped"


func _ready():
	autoplay      = false
	stream_paused = false
	playing       = false


#Methods
func set_resource_path(resource_path : String):
	if _mixed_resources:
		push_warning("MusicManager::set_resource_path() -> Mixed resources is set to true.")
	
	if resource_path.empty():
		push_error("MusicManager::set_resource_path() -> Resource path can't be null.")
		return
		
	var directory = Directory.new();
	
	if not directory.dir_exists(resource_path):
		push_error("MusicManager::set_resource_path() -> Directory not found : " + resource_path)
		return
	
	_resource_path = resource_path


func allow_mixed_resources():
	_mixed_resources = true


func disallow_mixed_resources():
		_mixed_resources = false


func play_track(resource_path : String, add_resource_path = false):
	if resource_path.empty():
		push_error("MusicManager::play_track() -> Resource path can't be null.")
		return
	
	var path = ""
	
	if add_resource_path:
		path = _resource_path + resource_path
	else:
		path = resource_path
	
	if not File.new().file_exists(path):
		push_error("MusicManager::play_track() -> File not found : " + path)
		return
	
	var track = load(path) 
	stream = track
	
	_state = "Playing"
	
	play()


func stop_track():
	_state = "Stopped"
	
	stop()


# Manage playlist
func listen_to_playlist():
	if _playlist.size() == 0:
		push_error("MusicManager::play_playlist() -> Playlist is empty.")
		return
	
	play_track(_playlist[_current_track])


func add_track(resource_path : String):
	if resource_path.empty():
		push_error("MusicManager::add_track() -> Resource path can't be null.")
		return
	
	var path = ""
	
	if _mixed_resources:
		path = resource_path
	else:
		path = _resource_path + resource_path
	
	print(path)
	_playlist.append(path)


func remove_track(resource_path : String):
	if resource_path.empty():
		push_error("MusicManager::remove_track() -> Resource path can't be null.")
		return
	
	var path = ""
	
	if _mixed_resources:
		path = resource_path
	else:
		path = _resource_path + resource_path
		
	var index = _playlist.find(path)

	if index == -1:
		push_error("MusicManager::remove_track() -> Track not found. " + path)
		return
	
	_playlist.remove(index)


func clear_playlist():
	_playlist.clear()


func shuffle_playlist():
	pass


func next_track(autoplay = true):
	_current_track += 1
	
	if _current_track > _playlist.size() - 1:
		_current_track = 0
	
	if autoplay:
		listen_to_playlist()


func previous_track(autoplay = true):
	_current_track -= 1
	
	if _current_track < 0:
		_current_track = _playlist.size() - 1
	
	if autoplay:
		listen_to_playlist()


func pause():
	stream_paused = true
	_state        = "Paused"


func unpause():
	stream_paused = false
	_state        = "Unpaused"

func get_state():
	return _state


func current_track():
	return _playlist[_current_track]

func search_track(search_string):
	if search_string.empty():
		push_error("MusicManager::search_track() -> Search term can't be null.")
		return
	
	#for
		#match
