#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name Bullet

extends KinematicBody2D


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
var _velocity: Vector2 = Vector2.ZERO
var _soundboard = {}

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


#------------------------------
# PRIVATE
#------------------------------
func __timer() -> void:
	var timer = Timer.new()
	add_child(timer)
	timer.connect("timeout", self, "__timeout")
	timer.wait_time = LIFETIME
	timer.start()

func __initialize() -> void:
	pass


func __timeout() -> void:
	call_deferred("queue_free")


func __flip_bullet(direction: int) -> void:
	$Container.set_rotation(0) # Fix a bug due to move and slide
		
	if direction == -1:
		$Container.set_scale(Vector2(-1,1))
	else:
		$Container.set_scale(Vector2(1,1))


func __add_sound(name: String, path: String):
	_soundboard[name] = path


#------------------------------
# PUBLIC
#------------------------------

func fire(looking_left: bool) -> void:
	__flip_bullet(looking_left)
	
	if looking_left:
		_velocity.x = -SPEED
	else:
		_velocity.x = SPEED


func play_sound(name: String):
	$Managers/Sound.stream = load(_soundboard[name])
	$Managers/Sound.play()


func stop_motion() -> void:
	set_physics_process(false)


# warning-ignore:unused_argument
# warning-ignore:unused_argument
func spawn(direction: int, pos: Vector2, offset: Vector2) -> void:
	position = pos
	$Container.position = offset
	_velocity.x = SPEED * direction
	
	__flip_bullet(direction)
	
