#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name GameObject

extends KinematicBody2D


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


#------------------------------
# PRIVATE
#------------------------------

var velocity: Vector2 = Vector2.ZERO


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# VIRTUAL
#------------------------------

func _ready() -> void:
	__initialize()


# warning-ignore:unused_argument
func _physics_process(delta: float) -> void:
	velocity = move_and_slide(velocity, Vector2.UP)


#------------------------------
# PRIVATE
#------------------------------

func __initialize() -> void:
	pass


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


func flip_object(axis: String, direction: int) -> void:
	var new_scale: Vector2 = $Container.scale
	
	match axis:
		"x":
			new_scale.x = direction
		"y":
			new_scale.y = direction
	
	$Container.set_rotation(0) # Fix a bug due to move and slide
	$Container.scale = new_scale


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
