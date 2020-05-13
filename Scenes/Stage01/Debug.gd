extends Panel


onready var Donovan = owner.get_node("Ground/Renderer/Donovan")


# warning-ignore:unused_argument
func _process(delta) -> void:
	$Label.text = "Donovan : %s / %s HP" % [Donovan.get_health(), Donovan.get_max_health()]
