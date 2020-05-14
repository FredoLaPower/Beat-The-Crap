#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name Hitbox
extends Area2D


#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

#------------------------------
# EXPORT
#------------------------------
export(int) var DAMAGE


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# VIRTUAL
#------------------------------

func _ready() -> void:
	# warning-ignore:return_value_discarded
	connect("area_entered", self, "__area_entered")
# warning-ignore:return_value_discarded
	connect("area_exited", self, "__area_exited")


#------------------------------
# PRIVATE
#------------------------------

func __area_entered(area: Area2D) -> void:
	if owner.RangeBox.find_threat(area.get_owner().get_instance_id()) != -1 && area.is_in_group("Hurtboxes"):
		area.get_owner().take_damage(DAMAGE)
		
		__area_entered_callback()


# warning-ignore:unused_argument
func __area_exited(area: Area2D) -> void:
	pass


func __area_entered_callback() -> void:
	pass


func __area_exited_callback() -> void:
	pass
