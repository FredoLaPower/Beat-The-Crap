#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name State

extends Node


#------------------------------------------------------------
# SIGNALS
#------------------------------------------------------------
signal finished(next_state)
signal animate(anim_name)

#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# PUBLIC
#------------------------------

func initialize():
	pass


func enter():
	pass


func exit():
	pass

func update(delta):
	pass


func handle_input(event):
	pass

func _on_animation_finished(anim_name):
	pass
