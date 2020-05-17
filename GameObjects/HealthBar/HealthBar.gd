#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

extends Node2D


#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

#------------------------------
# EXPORT
#------------------------------

export(NodePath) var HURTBOX
export(NodePath) var HEALTH
export(NodePath) var HEALTH_BAR


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# PUBLIC
#------------------------------

func initialize() -> void:
	# warning-ignore:return_value_discarded
	get_node(HURTBOX).connect("taking_damage", self, "update")
	$ProgressBar.value = get_node(HEALTH).MAX_HEALTH
	$ProgressBar.max_value = get_node(HEALTH).MAX_HEALTH

func update() -> void:
	$ProgressBar.value = get_node(HEALTH).get_health()
