#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name RangeBox
extends Area2D


#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

#------------------------------
# PRIVATE
#------------------------------

var _threats: Array = []


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

func __add_threat(node_id: int) -> void:
	_threats.push_front(node_id)


func __remove_threat(node_id: int) -> void:
	var index = _threats.find(node_id)
	
	if index == -1:
		return
	
	_threats.remove(index)


func get_threat_array() -> Array:
	return _threats


func __body_entered(body: Node2D) -> void:
		__add_threat(body.get_instance_id())
		
		__body_entered_callback()


func __body_exited(body: Node2D) -> void:
		__remove_threat(body.get_instance_id())
		
		__body_exited_callback()


func __body_entered_callback() -> void:
	pass


func __body_exited_callback() -> void:
	pass


#------------------------------
# PUBLIC
#------------------------------

func find_threat(id: int) -> int:
	return _threats.find(id)
