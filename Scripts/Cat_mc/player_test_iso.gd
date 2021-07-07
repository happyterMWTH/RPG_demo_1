extends KinematicBody2D

#Constantes o variables sencillas
const Var = preload("res://Scripts/Cat_mc/Variables_player_iso.gd")
const selection = preload("res://Scenes/UI/Selection.tscn")

var velocity = Vector2.ZERO

var instance = selection.instance()
var selected = false

func _physics_process(delta):
	if selected:
		add_child(instance)
		instance.position.y = -10
		get_parent().selected += 1
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("control_right")\
	- Input.get_action_strength("control_left")
	input_vector.y = Input.get_action_strength("control_down")\
	- Input.get_action_strength("control_up")
	
	if input_vector != Vector2.ZERO:
		velocity = input_vector
	else:
		velocity = Vector2.ZERO
	move_and_collide(velocity * delta * Var.max_speed)






func _on_Player_iso_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("shift"):
		if Input.is_action_just_pressed("left_click"):
			if selected:
				selected = false
			else:
				selected = true


