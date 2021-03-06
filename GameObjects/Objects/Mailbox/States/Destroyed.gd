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

#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# PRIVATE
#------------------------------

func __on_animation_finished(anim_name: String) -> void:
	if anim_name == "Destroy":
		owner.queue_free()


#------------------------------
# PUBLIC
#------------------------------

func initialize() -> void:
	# warning-ignore:return_value_discarded
	get_node(ANIMATIONS).connect("animation_finished", self, "__on_animation_finished")


func enter() -> void:
	get_node(ANIMATIONS).play("Destroy")
