#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name Hurtbox
extends Area2D

#------------------------------------------------------------
# SIGNALS
#------------------------------------------------------------

signal taking_damage


#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

#------------------------------
# EXPORT
#------------------------------

export(NodePath) var THICKNESS
export(NodePath) var HEALTH


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# VIRTUAL
#------------------------------

func _ready() -> void:
	# warning-ignore:return_value_discarded
	connect("area_entered", self, "__area_entered")


#------------------------------
# PRIVATE
#------------------------------

# warning-ignore:unused_argument
func __area_entered(area: Area2D) -> void:
	if __is_in_range(area.get_owner().global_position, area.get_thickness()) && area.is_in_group("Hitboxes"):
		var damage = __evaluate_damage(area.DAMAGE, area.DAMAGE_TYPE)
		
		if damage > 0:
			get_node(HEALTH).take_damage(damage)
			emit_signal("taking_damage")
		
		area.emit_signal("hit")
		area.callback(damage > 0)


func __is_in_range(foe_position: Vector2, foe_thickness: int) -> bool:
	var pos = owner.global_position.y + get_node(THICKNESS).THICKNESS / 2
	
	return pos >= foe_position.y && pos <= foe_position.y + foe_thickness


# This function must be overloaded
# warning-ignore:unused_argument
func __evaluate_damage(damage: int, type: int = 1) -> int: 
	return 0
