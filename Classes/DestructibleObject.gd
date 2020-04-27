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
var _soundboard = {}


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# VIRTUAL
#------------------------------

func _ready():
	_current_health = HEALTH
	
	$Animations/AnimationPlayer.play(START_STATE)
	
	__initialize()


# warning-ignore:unused_argument
func _physics_process(delta):
	pass


#------------------------------
# PRIVATE
#------------------------------
func __add_sound(name: String, path: String):
	_soundboard[name] = path


func __initialize() -> void:
	pass


#------------------------------
# PUBLIC
#------------------------------

func initialize() -> void:
	pass


func add_threat(guid: int) -> void:
	_threats.push_front(guid)


func remove_threat(guid: int) -> void:
	var index = _threats.find(guid)
	
	if index == -1:
		return
	
	_threats.remove(index)


func play_sound(name: String):
	$SoundPlayer.stream = load(_soundboard[name])
	$SoundPlayer.play()
