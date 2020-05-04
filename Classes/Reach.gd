#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name Reach

extends Area2D


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# VIRTUAL
#------------------------------

func _ready() -> void:
# warning-ignore:return_value_discarded
	connect("body_entered", self, "_body_entered")
# warning-ignore:return_value_discarded
	connect("body_exited", self, "_body_exited")

#------------------------------
# PRIVATE
#------------------------------

func _body_entered(body: Node2D) -> void:
	if is_instance_valid(owner):
		owner.add_threat(body.get_instance_id())
		
		print("%s said: %s is at reach" % [owner.get_name(), body.get_name()])


func _body_exited(body: Node2D) -> void:
	if is_instance_valid(owner):
		owner.remove_threat(body.get_instance_id())
		
		print("%s said: %s is out of reach" % [owner.get_name(), body.get_name()])
