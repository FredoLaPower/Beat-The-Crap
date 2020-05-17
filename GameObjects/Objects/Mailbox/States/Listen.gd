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
export(NodePath) var SPRITESHEET
export(NodePath) var HEALTH
export(NodePath) var HURTBOX


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# PRIVATE
#------------------------------
func initialize() -> void:
	get_node(SPRITESHEET).frame = 0
	
	# warning-ignore:return_value_discarded
	get_node(HURTBOX).connect("taking_damage", self, "__taking_damage")


func __taking_damage() -> void:
	if get_node(HEALTH).get_health() <= 0:
		emit_signal("finished", "Destroyed")
		return
	
	elif get_node(HEALTH).get_health() < get_node(HEALTH).MAX_HEALTH / 2:
		get_node(SPRITESHEET).frame = 1
	
	get_node(ANIMATIONS).stop()
	get_node(ANIMATIONS).play("Hit")
