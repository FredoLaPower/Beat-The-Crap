#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name InputController
extends Node

var _inputs = {} # [input_name, sid, sum]
var _inputs_stack: Array = [] # [input_name, timestamp] only pressed inputs are tracked | removed released for now
var _inputs_max_entries: int = 10
var _encoded_inputs: String = ""
var _inputs_trace: int = 500 #we track the last 500ms

# warning-ignore:unused_argument
func _process(delta) -> void:
	encode_inputs_stack()


func _unhandled_input(event: InputEvent) -> void:
	log_input(event)
	encode_inputs_stack()


func add_input(name: String, code: String) -> void:
	_inputs[name] = code


func log_input(event:InputEvent) -> void:
	for input in _inputs:
		if event.is_action_pressed(input):
			_inputs_stack.push_back([input, OS.get_ticks_msec()])

	if _inputs_stack.size() > _inputs_max_entries:
		_inputs_stack.pop_front()


func encode_inputs_stack() -> void:
	var time_elapsed = OS.get_ticks_msec()

	_encoded_inputs = ""

	for input in _inputs_stack:
		if time_elapsed - input[1] < _inputs_trace:
			_encoded_inputs += _inputs[input[0]]


func get_encoded_inputs() -> String:
	return _encoded_inputs
