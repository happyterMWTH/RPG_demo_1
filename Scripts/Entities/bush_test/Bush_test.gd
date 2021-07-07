extends StaticBody2D
const selection = preload("res://Scenes/UI/Selection.tscn")
var instance = selection.instance()
var selected = false
func _physics_process(delta):
	if selected:
		add_child(instance)
	
		
func _on_StaticBody2D_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("shift"):
		
		if Input.is_action_just_pressed("left_click"):
			if selected:
				selected = false
			else:
				selected = true


