extends Camera2D
const ratio = 0.05
const upper_zoom_limit = 2.5
const lower_zoom_limit = 1.0
var zooming = false
var up
var down
var desire = $".".zoom.x

func _physics_process(delta):
	if Input.is_action_pressed("debug_plus"):
		desire = 90
		zooming = true
	if desire < lower_zoom_limit:
		desire = lower_zoom_limit
	elif desire > upper_zoom_limit:
		desire = upper_zoom_limit
	adjust_zoom(desire)

func adjust_zoom(desired):
	if zooming:
		if $".".zoom.x < desired:
			$".".zoom.x += ratio
			$".".zoom.y += ratio
			up = true
		elif $".".zoom.x > desired:
			$".".zoom.x -= ratio
			$".".zoom.y -= ratio
			down = true
	if $".".zoom == Vector2.ONE * desired or (up and down):
		$".".zoom = Vector2.ONE * desired
		zooming = false

