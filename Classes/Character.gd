#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name PlayerCharacter

extends KinematicBody2D

#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

#------------------------------
# EXPORT
#------------------------------
export(Vector2) var MAX_SPEED = Vector2(0, 0)
export(int) var JUMP_FORCE = 0


#------------------------------
# PRIVATE
#------------------------------
var _flags = {
	"is_looking_left" : false,
	"is_on_floor" : true
}

var _special_moves = {}
var _soundboard = {}
var _hitboxes = {}


#------------------------------
# PUBLIC
#------------------------------
var velocity: Vector2 = Vector2.ZERO


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# VIRTUAL
#------------------------------

func _ready() -> void:
	# Subscribe to Controller signal
	$Managers/Control.initialize()
	
	__initialize()


# warning-ignore:unused_argument
func _physics_process(delta: float) -> void:
	if !get_flag("is_on_floor"):
		$Container.velocity.y += Constants.GRAVITY * delta

	velocity = move_and_slide(velocity, Vector2.UP)


#------------------------------
# PRIVATE
#------------------------------

func __initialize() -> void:
	pass


func __add_sound(name: String, path: String) -> void:
	_soundboard[name] = path


func __add_special_move(name: String, signature: String) -> void:
	_special_moves[name] = signature


func __add_hitbox(name: String, collider: CollisionShape2D) -> void:
	_hitboxes[name] = collider


#------------------------------
# PUBLIC
#------------------------------

func disable_hitboxes() -> void:
	for hitbox in _hitboxes:
		_hitboxes[hitbox].disabled = true
		_hitboxes[hitbox].get_parent().position = Vector2.ZERO


func get_flag(flag_name: String) -> bool:
	return _flags[flag_name]


func set_flag(flag_name: String, value: bool) -> void:
	_flags[flag_name] = value


func play_sound(name: String):
	$Managers/Sound.stream = load(_soundboard[name])
	$Managers/Sound.play()


func flip_character(is_looking_left: bool) -> void:
	set_flag("is_looking_left", is_looking_left)
	
	$Container.set_rotation(0) # Fix a bug due to move and slide
	
	if is_looking_left:
		$Container.set_scale(Vector2(-1,1))
	else:
		$Container.set_scale(Vector2(1,1))


func special_move(name: String) -> bool:
	var input_strings: Array = _special_moves[name].split("||")
	
	for input_string in input_strings:
		if $Managers/Control.get_encoded_inputs().find(input_string) != -1:
			return true
	
	return false
