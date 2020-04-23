#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name Character

extends KinematicBody2D

#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

#------------------------------
# EXPORT
#------------------------------
export(Vector2) var MAX_SPEED = Vector2(0, 0)
export(Vector2) var START_POSITION
export(int) var JUMP_FORCE = 0
export(NodePath) var SPRITE_SHEET
export(NodePath) var STATE_MACHINE
export(NodePath) var HORIZON_CONTAINER
export(NodePath) var PIVOT_CONTAINER

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
	#Player positioon
	position = START_POSITION
	
	# Subscribe to Controller signal
	get_node(STATE_MACHINE).initialize()
	
	for child in get_node(HORIZON_CONTAINER).get_children():
		# warning-ignore:return_value_discarded
		child.connect("horizon_crossed", self, "_crossing_horizon")
	
	_initialize()

# warning-ignore:unused_argument
func _physics_process(delta: float) -> void:
	velocity = move_and_slide(velocity, Vector2.UP)


#------------------------------
# PRIVATE
#------------------------------
func _initialize() -> void:
	pass


func _crossing_horizon(body: Node, is_crossing_horizon: bool) -> void:
	_flags["is_crossing_horizon"] = is_crossing_horizon



#------------------------------
# PUBLIC
#------------------------------
func get_flag(flag_name: String) -> bool:
	return _flags[flag_name]


func flip_character(is_looking_left: bool = false) -> void:
		_flags["is_looking_left"] = is_looking_left
		
		if is_looking_left:
			get_node(PIVOT_CONTAINER).scale.x = -1
		else:
			get_node(PIVOT_CONTAINER).scale.x = 1
