#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name DestructibleObject

extends KinematicBody2D


#------------------------------------------------------------
# SIGNALS
#------------------------------------------------------------



#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

# Common writing convention for properties
#     1. Use snake_case for property name
#     2. Use static typing whenever possible

#------------------------------
# EXPORT
#------------------------------
export(String) var START_STATE


#------------------------------
# PRIVATE
#------------------------------
var _current_state: String = ""
var _state_dictionary = {} # No static typing for dictionary


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# VIRTUAL
#------------------------------

# warning-ignore:unused_argument
func _physics_process(delta):
	pass


#------------------------------
# PRIVATE
#------------------------------

# warning-ignore:unused_argument
func __change_state(new_state: String) -> void:
	pass


#------------------------------
# PUBLIC
#------------------------------

func initialize() -> void:
	pass
