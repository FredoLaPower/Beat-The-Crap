#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name Hurtbox

extends Area2D

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
	if owner._threats.find(area.get_owner().get_instance_id()) != -1 && area.is_in_group("Hitboxes"):
		owner._current_health -= area.get_damage()
		
		__area_entered_callback()
		
		print("%s -> %s (%s dmg)" % [area.get_owner().get_name(), area.get_name(), area.get_damage()])
		print("%s -> %s / %s HP" % [owner.get_name(), owner._current_health, owner.HEALTH])
	else:
		print("something entered but who cares...")


# warning-ignore:unused_argument
func __area_exited(area: Area2D) -> void:
	pass


func __area_entered_callback() -> void:
	pass


func __area_exited_callback() -> void:
	pass
