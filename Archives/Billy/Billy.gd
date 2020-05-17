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
	
	pos.x = $Pivot/SpawnPoints/Fireball.global_position.x
	pos.y = Pivot.global_position.y
	
	offset.y = $Pivot/SpawnPoints/Fireball.position.y #relative position from Billy's origin (same offset)
	direction = -1 if Flags.get_flag("is_looking_left") else 1
	
	Globals.Renderer.add_child(bullet)
	
	bullet.spawn(direction, pos, offset)
