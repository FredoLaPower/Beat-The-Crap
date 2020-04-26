#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name DestructibleObject

extends KinematicBody2D


#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

#------------------------------
# EXPORT
#------------------------------
export(String) var START_STATE
export(int) var HEALTH


#------------------------------
# PRIVATE
#------------------------------
var _current_state: String = ""
var _threats: Array = []
var _current_health = 0

#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# VIRTUAL
#------------------------------

func _ready():
	_current_health = HEALTH
	
	$Animations/AnimationPlayer.play(START_STATE)


# warning-ignore:unused_argument
func _physics_process(delta):
	pass


#------------------------------
# PRIVATE
#------------------------------

# warning-ignore:unused_argument
func __change_state(new_state: String) -> void:
	pass


#------------------------------
# PUBLIC
#------------------------------

func initialize() -> void:
	pass


func add_threat(guid: int) -> void:
	_threats.push_front(guid)
	
	print("My list of foes: %s" % _threats)


func remove_threat(guid: int) -> void:
	var index = _threats.find(guid)
	
	if index == -1:
		return
	
	_threats.remove(index)
	if _threats.size() > 0:
		print("My list of foes: %s" % _threats)
	else:
		print("I'm safe...")
