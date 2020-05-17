#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name HealthComponent
extends Node


#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

#------------------------------
# EXPORT
#------------------------------

export(int) var MAX_HEALTH
export(NodePath) var HEALTH_BAR


#------------------------------
# PRIVATE
#------------------------------

var _current_health: int = 0


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# VIRTUAL
#------------------------------

func _ready() -> void:
	_current_health = MAX_HEALTH


#------------------------------
# PUBLIC
#------------------------------

func initialize() -> void:
	if HEALTH_BAR != "":
		get_node(HEALTH_BAR).value = MAX_HEALTH
		get_node(HEALTH_BAR).max_value = MAX_HEALTH


func take_damage(damage: int) -> void:
	_current_health -= damage
	get_node(HEALTH_BAR).value = _current_health


func get_health() -> int:
		return _current_health
