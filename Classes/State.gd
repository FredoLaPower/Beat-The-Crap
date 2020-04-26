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

# warning-ignore:unused_argument
func update(delta: float) -> void:
	pass


# warning-ignore:unused_argument
func handle_input(event: InputEvent) -> void:
	pass

# warning-ignore:unused_argument
func _on_animation_finished(anim_name: String) -> void:
	pass
