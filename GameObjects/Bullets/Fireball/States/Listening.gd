#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

extends "res://Classes/StateMachine/State.gd"


#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

#------------------------------
# EXPORT
#------------------------------

export(NodePath) var ANIMATIONS
export(NodePath) var FLAGS
export(NodePath) var HITBOX
export(NodePath) var MOVE


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# PRIVATE
#------------------------------
func initialize() -> void:
	# warning-ignore:return_value_discarded
	get_node(HITBOX).connect("hit", self, "__hit")


func __hit() -> void:
	emit_signal("finished", "Explode")


#------------------------------
# PUBLIC
#------------------------------

func enter() -> void:
	get_node(MOVE).velocity.x = - get_node(MOVE).MAX_SPEED.x if get_node(FLAGS).get_flag("is_looking_left") else get_node(MOVE).MAX_SPEED.x
	get_node(ANIMATIONS).play("Fire")
