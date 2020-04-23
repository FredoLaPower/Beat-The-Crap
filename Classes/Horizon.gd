#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name Horizon
extends Area2D


#------------------------------------------------------------
# SIGNALS
#------------------------------------------------------------

# warning-ignore:unused_signal
signal horizon_crossed(body, state)


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# PRIVATE
#------------------------------
func _ready():
	# warning-ignore:return_value_discarded
	connect("body_entered", self, "_playe_entered")
	
	# warning-ignore:return_value_discarded
	connect("body_exited", self, "_playe_exited")


func _playe_entered(body: Node) -> void:
	emit_signal("horizon_crossed", body, true)


func _playe_exited(body: Node) -> void:
	emit_signal("horizon_crossed", body, false)
