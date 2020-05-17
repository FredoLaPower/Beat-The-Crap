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
export(NodePath) var SPAWNER
export(NodePath) var SPAWN_POINT

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
	var direction = -1 if get_node(FLAGS).get_flag("is_looking_left") else 1
	var pos = Vector2(get_node(SPAWN_POINT).global_position.x, owner.global_position.y)
	var offset = Vector2(0, get_node(SPAWN_POINT).position.y)
	
	get_node(SPAWNER).spawn(direction, pos, offset)
	
	get_node(FLAGS).set_flag("is_in_motion", false)
	get_node(ANIMATIONS).play("Hadouken")


func __on_animation_finished(anim_name: String) -> void:
	if anim_name == "Hadouken":
		emit_signal("finished", "Previous")
