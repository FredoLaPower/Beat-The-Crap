#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name GameObject

extends StaticBody2D


#------------------------------------------------------------
# SIGNALS
#------------------------------------------------------------

# warning-ignore:unused_signal
signal released(node_id)


#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

#------------------------------
# PRIVATE
#------------------------------

var _flags = {}
var _threats: Array = []


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# PRIVATE
#------------------------------

func __add_flag(name: String, value: bool) -> void:
	_flags[name] = value


#------------------------------
# PUBLIC
#------------------------------

### CONTAINER ###
func disable_hitboxes(value: bool = true) -> void:
	for hitbox in $Container/Colliders/Hitboxes.get_children():
		if value:
			hitbox.position = Vector2.ZERO
		
		hitbox.get_node("Collider").disabled = value


### FLAGS ###
func get_flag(flag_name: String) -> bool:
	return _flags[flag_name]


func set_flag(flag_name: String, value: bool) -> void:
	_flags[flag_name] = value


### THREATS ###
func add_threat(node_id: int) -> void:
	_threats.push_front(node_id)


func remove_threat(node_id: int) -> void:
	var index = _threats.find(node_id)
	
	if index == -1:
		return
	
	_threats.remove(index)


func get_threats() -> Array:
	return _threats


### OTHER ###
func play_sound(name: String):
	$Managers/Sound.stream = Cache.sound_samples[name]
	$Managers/Sound.play()
