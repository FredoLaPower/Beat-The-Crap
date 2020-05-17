#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name Kinematic
extends KinematicBody2D


#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

#------------------------------
# PUBLIC
#------------------------------

onready var Body = $Body
onready var Pivot = $Pivot
onready var Animations = $Controllers/Animations
onready var Automaton = $Controllers/StateMachine
onready var Flags = $Controllers/Flags
onready var SoundBox = $Controllers/SoundBox

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
# PUBLIC
#------------------------------

# warning-ignore:unused_argument
func flip_object(axis: String, direction: int) -> void:
	for child in Pivot.get_children():
		match axis:
			"x":
				child.scale.x = direction
			"y":
				child.scale.Y = direction
