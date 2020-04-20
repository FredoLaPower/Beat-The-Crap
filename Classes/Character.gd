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

#------------------------------
# PUBLIC
#------------------------------
var velocity: Vector2 = Vector2.ZERO
var is_looking_left: bool = false


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------
func _ready() -> void:
	#Player positioon
	position = START_POSITION
	
	# Subscribe to Controller signal
	get_node(STATE_MACHINE).initialize()


func _physics_process(_delta: float) -> void:
	velocity = move_and_slide(velocity, Vector2.UP)


func _process(_delta: float) -> void:
	get_node(SPRITE_SHEET).flip_h = is_looking_left
