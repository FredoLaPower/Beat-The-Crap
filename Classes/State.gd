#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name State

extends Node


#------------------------------------------------------------
# SIGNALS
#------------------------------------------------------------
# warning-ignore:unused_signal
signal finished(next_state, is_sub_state)


#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

#------------------------------
# EXPORT
#------------------------------
export(NodePath) var ANIMATION_PLAYER


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# PUBLIC
#------------------------------

func initialize() -> void:
	pass


func enter() -> void:
	pass


func exit() -> void:
	pass

func update(_delta: float) -> void:
	pass


func handle_input(_event: InputEvent) -> void:
	pass

func _on_animation_finished(_anim_name: String) -> void:
	pass
