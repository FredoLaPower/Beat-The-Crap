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

export(NodePath) var FLAGS
export(NodePath) var ANIMATIONS


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# PUBLIC
#------------------------------


func initialize() -> void:
	# warning-ignore:return_value_discarded
	get_node(ANIMATIONS).connect("animation_finished", self, "__on_animation_finished")


func enter() -> void:
	get_node(FLAGS).set_flag("is_in_motion", false)
	get_node(ANIMATIONS).play("Combo")


func __on_animation_finished(anim_name: String) -> void:
	if anim_name == "Combo":
		emit_signal("finished", "Previous")
