extends CanvasLayer
var drawing = false
var path = PackedVector2Array()

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

func draw_path():
	var line = Line2D.new()
	line.width = 5  # Set your desired line width
	line.points = path
	add_child(line)


