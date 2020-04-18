extends "res://Classes/State.gd"

var velocity: Vector2 = Vector2.ZERO
var MAX_SPEED_X: int = 100
var MAX_SPEED_Y: int = 50

func enter():
	owner.get_node("Animations/AnimationPlayer").play("Walk")


func update(delta):
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var y_input = Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down")
	
	velocity.x = x_input * MAX_SPEED_X
	velocity.y = -y_input * MAX_SPEED_Y
	
	velocity = owner.move_and_slide(velocity, Vector2.UP)
	
	owner.get_node("Animations/Spritesheet").flip_h = x_input < 0
	
	owner.get_node("Label").text = "X: %s ; Y: %s" % [x_input, y_input]
	
	if x_input == 0 && y_input == 0:
		emit_signal("finished","Idle")


func handle_input(event):
	if event.is_action_pressed("ui_jump"):
		emit_signal("finished", "sub_Jump")
	
	if event.is_action_pressed("ui_punch"):
		emit_signal("finished", "sub_Punch")
		return
	
	if event.is_action_pressed("ui_kick"):
		emit_signal("finished", "sub_Kick")
		return
