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
	"is_crossing_horizon" : false
}


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
	
	_initialize()


# warning-ignore:unused_argument
func _physics_process(delta: float) -> void:
	velocity = move_and_slide(velocity, Vector2.UP)


#------------------------------
# PRIVATE
#------------------------------

func _initialize() -> void:
	pass


# warning-ignore:unused_argument
func _crossing_horizon(body: Node, is_crossing_horizon: bool) -> void:
	_flags["is_crossing_horizon"] = is_crossing_horizon


#------------------------------
# PUBLIC
#------------------------------

func get_flag(flag_name: String) -> bool:
	return _flags[flag_name]


func flip_character(is_looking_left: bool = false) -> void:
		_flags["is_looking_left"] = is_looking_left
		
		$Pivot.set_rotation(0) # Fix a bug due to move and slide
		
		if is_looking_left:
			$Pivot.set_scale(Vector2(-1,1))
		else:
			$Pivot.set_scale(Vector2(1,1))
