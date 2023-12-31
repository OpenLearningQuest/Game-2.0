extends CanvasLayer


var drawing = false
var path = PackedVector2Array()
var zoom_speed = 0.1

func _ready():
	set_process_input(true)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			drawing = event.pressed
			if drawing:
				path.clear()
				path.append(event.position)
			else:
				# Finish drawing
				path.append(event.position)
				draw_path()

	elif event is InputEventMouseMotion and drawing:
		path.append(event.position)
		draw_path()

	elif event is InputEventKey:
		if event.scancode == KEY_I:
			print("Zoom in")
			# Zoom in
			scale *= 1.0 - zoom_speed

		elif event.scancode == KEY_O:
			print("Zoom out")
			# Zoom out
			scale /= 1.0 - zoom_speed

			# Ensure a minimum and maximum scale
			scale.x = clamp(scale.x, 0.1, 10.0)
			scale.y = clamp(scale.y, 0.1, 10.0)

func draw_path():
	var line = Line2D.new()
	line.width = 5  # Set your desired line width
	line.points = path
	add_child(line)



