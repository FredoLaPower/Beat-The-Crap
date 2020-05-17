#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name Static
extends StaticBody2D


#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

#------------------------------
# PUBLIC
#------------------------------

onready var Body = $Body
onready var Animations = $Controllers/Animations
onready var Automaton = $Controllers/StateMachine
onready var Flags = $Controllers/Flags
onready var SoundBox = $Controllers/SoundBox
