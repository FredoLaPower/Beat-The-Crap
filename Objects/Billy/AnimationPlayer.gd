extends AnimationPlayer


func initialize(controller: StateMachine):
	for child in controller.get_children():
		child.connect("animate", self, "__play")
		child.initialize()


func __play(anim_name):
	stop()
	play(anim_name)
