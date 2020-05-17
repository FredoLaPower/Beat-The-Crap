extends Panel

onready var Billy = owner.get_node("Ground/Renderer/Billy")

func _process(_delta: float) -> void:
	$Label.text = str(Billy.get_node("Components/Automaton").get_pushdown())
