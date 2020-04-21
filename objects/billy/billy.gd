extends "res://Classes/Character.gd"

#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# PRIVATE
#------------------------------

func _initialize() -> void:
	$Boxes/Damage/Collider.set_disabled(true)
