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
export(int) var DAMAGE = 0

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
	queue_free()


func __flip_bullet(is_looking_left: bool) -> void:
	$Pivot.set_rotation(0) # Fix a bug due to move and slide
		
	if is_looking_left:
		$Pivot.set_scale(Vector2(-1,1))
	else:
		$Pivot.set_scale(Vector2(1,1))


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
	$SoundPlayer.stream = load(_soundboard[name])
	$SoundPlayer.play()


func stop_motion() -> void:
	set_physics_process(false)


func get_damage() -> int:
	return DAMAGE


# warning-ignore:unused_argument
# warning-ignore:unused_argument
func spawn(looking_left: bool, pos: Vector2, offset: Vector2) -> void:
	__flip_bullet(looking_left)
	
	_velocity.x = SPEED
	
	
