#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

extends "res://Classes/Objects/Kinematic/Player.gd"


#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

#------------------------------
# PUBLIC
#------------------------------

var Fireball: PackedScene = preload("res://GameObjects/Bullets/Fireball/Fireball.tscn")


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# VIRTUAL
#------------------------------

func _ready() -> void:
	Flags.add_flag("is_looking_left", false)
	Flags.add_flag("is_on_floor", true)
	Flags.add_flag("is_in_motion", false)
	
	Cache.preload_resource("sound_sample", "woosh", "res://assets/audio/sounds/sf2_woosh.wav")
	Cache.preload_resource("sound_sample", "hadouken", "res://assets/audio/sounds/sf2_hadouken.wav")
	
	__add_special_move("Hadouken", "DRP||DLP")
	
	disable_hitboxes()
	
	Automaton.initialize()


#------------------------------
# PUBLIC
#------------------------------

func fireball() -> void:
	var bullet: Node2D = Fireball.instance()
	var pos: Vector2 = Vector2.ZERO
	var offset: Vector2 = Vector2.ZERO
	var direction: int = 0
	
	pos.x = $Container/SpawnPoints/Fireball.global_position.x
	pos.y = global_position.y
	offset.y = $Container/SpawnPoints/Fireball.position.y #relative position from Billy's origin (same offset)
	direction = -1 if FlagController.et_flag("is_looking_left") else 1
	
	Globals.Renderer.add_child(bullet)
	
	bullet.spawn(direction, pos, offset)
