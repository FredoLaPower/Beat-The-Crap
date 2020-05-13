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
	connect("body_entered", self, "__body_entered")
# warning-ignore:return_value_discarded
	connect("body_exited", self, "__body_exited")

#------------------------------
# PRIVATE
#------------------------------

func __body_entered(body: Node2D) -> void:
	if is_instance_valid(owner):
		owner.add_threat(body.get_instance_id())
		
		__body_entered_callback()
		
		print("[%s] threats entered: %s" % [owner.get_name(), String(owner.get_threats())])


func __body_exited(body: Node2D) -> void:
	if is_instance_valid(owner):
		owner.remove_threat(body.get_instance_id())
		
		__body_exited_callback()
		
		print("[%s] threats exited: %s" % [owner.get_name(), String(owner.get_threats())])


func __body_entered_callback() -> void:
	pass

func __body_exited_callback() -> void:
	pass
