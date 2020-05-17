extends Label


onready var Health = owner.get_node("Components/Health")

func _process(_delta: float) -> void:
	text = "%s / %s" % [Health.get_health(), Health.MAX_HEALTH]
