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

var _moves = {
	"hadoken": "LDRP"
}

var _soundboard = {}


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
	$Controller.initialize()
	
	__initialize()


# warning-ignore:unused_argument
func _physics_process(delta: float) -> void:
	if !get_flag("is_on_floor"):
		$Pivot.velocity.y += Constants.GRAVITY * delta

	velocity = move_and_slide(velocity, Vector2.UP)


#------------------------------
# PRIVATE
#------------------------------

func __initialize() -> void:
	pass


func __add_sound(name: String, path: String):
	_soundboard[name] = path


#------------------------------
# PUBLIC
#------------------------------

func disable_hitboxes() -> void:
	pass


func get_flag(flag_name: String) -> bool:
	return _flags[flag_name]


func set_flag(flag_name: String, value: bool) -> void:
	_flags[flag_name] = value


func play_sound(name: String):
	$SoundPlayer.stream = load(_soundboard[name])
	$SoundPlayer.play()


func flip_character(is_looking_left: bool = false) -> void:
		set_flag("is_looking_left", is_looking_left)
		
		$Pivot.set_rotation(0) # Fix a bug due to move and slide
		
		if is_looking_left:
			$Pivot.set_scale(Vector2(-1,1))
		else:
			$Pivot.set_scale(Vector2(1,1))
