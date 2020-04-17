#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name StateMachine

extends Node


#------------------------------------------------------------
# SIGNALS
#------------------------------------------------------------

signal state_changed(new_state)


#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

#------------------------------
# EXPORT
#------------------------------
export(String) var START_STATE

#------------------------------
# PRIVATE
#------------------------------
var _current_state: String = ""
var _state_dictionary = {} # No static typing for dictionary
var _previous_state: String = ""
var _states_stack = [] # Use to store hierachy of states
var _is_active: bool = false


#------------------------------
# PUBLIC
#------------------------------



#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# VIRTUAL
#------------------------------
func _ready(): # is  used to initiate the state machine
	pass


func _physics_process(delta): # is used to update the current state
	_state_dictionary[_states_stack[0]].update(delta)


func _input(event): # is used to manage input for the current state
	_state_dictionary[_states_stack[0]].input(event)


#------------------------------
# PRIVATE
#------------------------------
func __add_state(state_name: String, state_node_path: Node):
	_state_dictionary[state_name] = state_node_path


func __change_state(new_state: String):
	if _state_dictionary[new_state] == null:
		push_error("StateMachine::__change_state() -> The state '%s' doesn't exist." % new_state)
		return
	
	if _states_stack.size() != 0:
		_state_dictionary[_states_stack[0]].exit() # we exit current state
		_states_stack.pop_front() # we pop out the current state from the stack
	
	if _states_stack.size() == 0: # if the stack is empty we push the new state
		_states_stack.push_front(new_state)
	
	elif _states_stack[0] != new_state: # if the next state in the stacj is different from the new one with push the new state
		_states_stack.push_front(new_state)
	
	_current_state = _states_stack[0]
	
	_state_dictionary[_states_stack[0]].enter() # we enter the new state
	
	emit_signal("state_changed", _current_state)


func __initialize():
	if START_STATE == "":
		push_error("FiniteStateMachine::initialize() -> 'Start State' is not declared in the parent node.")
		return
	
	__change_state(START_STATE)


#------------------------------
# PUBLIC
#------------------------------
func get_state():
	return _current_state

func get_states_stack():
	return _states_stack
