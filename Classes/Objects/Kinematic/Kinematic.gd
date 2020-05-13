#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name Kinematic
extends KinematicBody2D


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

# warning-ignore:unused_argument
func _physics_process(delta: float) -> void:
	velocity = move_and_slide(velocity, Vector2.UP)


#------------------------------
# PRIVATE
#------------------------------
func __add_flag(name: String, value: bool) -> void:
	_flags[name] = value


#------------------------------
# PUBLIC
#------------------------------

### CONTAINER ###

# warning-ignore:unused_argument
func disable_hitboxes(disable: bool = true) -> void:
	pass


func flip_object(axis: String, direction: int) -> void:
	for child in $Container.get_children():
		match axis:
			"x":
				child.scale.x = direction
			"y":
				child.scale.Y = direction


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
