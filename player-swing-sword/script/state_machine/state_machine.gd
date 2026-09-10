class_name StateMachine extends Node

@export var initial_state: State
var active_state: State
var active_state_name: String
var states: Dictionary = {}
var parent: Node

#to_lower() is used throughout to change the state's name into lowercase
func _ready() -> void:
	parent = get_parent()
	#this for loop adds all the state nodes to a dictionary, then
	#we can use it in the transition function
	for child: State in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.parent = parent
			
	if initial_state:
		initial_state.enter_state()
		active_state = initial_state

func _process(delta: float) -> void:
	if active_state:
		active_state.on_process(delta)

func _physics_process(delta: float) -> void:
	if active_state:
		active_state.on_physics_process(delta)
	#debug to check if states are loading correctly in output
	#print("Current State: ", active_state.name.to_lower())

#all the if statements in this function are safe guards
func transition_to(new_state_name: String) -> void:
	if new_state_name == active_state.name.to_lower():
		return
	
	var new_state: State = states.get(new_state_name.to_lower())
	
	if !new_state:
		return

	if active_state:
		active_state.exit_state()
	
	active_state = new_state
	
	if active_state:
		active_state.enter_state()
	
	active_state_name = active_state.name.to_lower()
