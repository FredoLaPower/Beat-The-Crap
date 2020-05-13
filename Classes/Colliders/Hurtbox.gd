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

# warning-ignore:unused_argument
func __area_entered(area: Area2D) -> void:
	pass


# warning-ignore:unused_argument
func __area_exited(area: Area2D) -> void:
	pass


func __area_entered_callback() -> void:
	pass


func __area_exited_callback() -> void:
	pass
