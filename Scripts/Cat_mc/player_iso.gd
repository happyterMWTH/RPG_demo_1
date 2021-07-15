extends KinematicBody2D

#Constantes 
var velocity = Vector2.ZERO
func _ready():
	pass

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("control_right")\
	- Input.get_action_strength("control_left")
	input_vector.y = Input.get_action_strength("control_down")\
	- Input.get_action_strength("control_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = input_vector
	else:
		velocity = Vector2.ZERO
	move_and_collide(velocity * delta * var_iso.max_speed)
