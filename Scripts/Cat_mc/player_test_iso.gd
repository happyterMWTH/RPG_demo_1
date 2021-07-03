extends KinematicBody2D

#Constantes 
const Var = preload("res://Scripts/Cat_mc/Variables_player_iso.gd")
var velocity = Vector2.ZERO
func _ready():
	pass

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("control_right")\
	- Input.get_action_strength("control_left")
	input_vector.y = Input.get_action_strength("control_down")\
	- Input.get_action_strength("control_up")
	
	if input_vector != Vector2.ZERO:
		velocity = input_vector
	else:
		velocity = Vector2.ZERO
	print(input_vector)
	move_and_collide(velocity * delta * Var.max_speed)

