#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name Bullet

extends "res://Classes/KinematicObject.gd"


#------------------------------------------------------------
# SIGNALS
#------------------------------------------------------------


#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

#------------------------------
# EXPORT
#------------------------------

export(int) var SPEED = 0 #in seconds
export(int) var LIFETIME = 0 #in seconds


#------------------------------
# PRIVATE
#------------------------------
var _release: bool = false
var _velocity: Vector2 = Vector2.ZERO


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# VIRTUAL
#------------------------------

func _ready() -> void:
	__timer()
	__initialize()


# warning-ignore:unused_argument
func _physics_process(delta) -> void:
	_velocity = move_and_slide(_velocity, Vector2.UP)
	
	if _release:
		call_deferred("queue_free")


#------------------------------
# PRIVATE
#------------------------------
func __timer() -> void:
	if LIFETIME == 0:
		return
	
	var timer = Timer.new()
	add_child(timer)
	timer.connect("timeout", self, "__timeout")
	timer.wait_time = LIFETIME
	timer.start()

func __initialize() -> void:
	pass


func __timeout() -> void:
	_release = true


func __flip_bullet(direction: int) -> void:
	$Container.set_rotation(0) # Fix a bug due to move and slide
		
	if direction == -1:
		$Container.set_scale(Vector2(-1,1))
	else:
		$Container.set_scale(Vector2(1,1))


#------------------------------
# PUBLIC
#------------------------------

func fire(looking_left: bool) -> void:
	__flip_bullet(looking_left)
	
	if looking_left:
		_velocity.x = -SPEED
	else:
		_velocity.x = SPEED


func stop_motion() -> void:
	_velocity = Vector2.ZERO


func spawn(direction: int, pos: Vector2, offset: Vector2) -> void:
	position = pos
	$Container.position = offset
	_velocity.x = SPEED * direction
	
	__flip_bullet(direction)
	
