extends Node2D

onready var _lines := $Lines

var _pressed := false
var _current_line := Line2D

func _input(event: InputEvent) -> void:
	if event is inputEventMouseButton:
		_pressed = event.pressed
		
		if _pressed:
			_current_line = Line2D.new()
			_lines.add_child(_current_line)
			
	if event is InputEventMouseMotion && _pressed:
		_current_line.add_point(event.position)
		
