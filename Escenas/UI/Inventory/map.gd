extends Control

var grid_size = Vector2(24, 24)
var segments = []


func _ready():
	var cell_w = size.x / grid_size.x
	var cell_h = size.y / grid_size.y

	for j in range(int(grid_size.y) + 1): #Líneas horizontales
		var y = j * cell_h
		for i in range(int(grid_size.x)):
			var seg = { "p1": Vector2(i * cell_w, y), "p2": Vector2((i+1) * cell_w, y), "color": Color.GRAY }
			segments.append(seg)

	for i in range(int(grid_size.x) + 1): #Líneas verticales
		var x = i * cell_w
		for j in range(int(grid_size.y)):
			var seg = { "p1": Vector2(x, j * cell_h), "p2": Vector2(x, (j+1) * cell_h), "color": Color.GRAY }
			segments.append(seg)
	queue_redraw()


func _draw():
	for seg in segments:
		draw_line(seg["p1"], seg["p2"], seg["color"], 2)


func _gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		var pos = event.position
		for seg in segments:
			if _is_near_segment(pos, seg["p1"], seg["p2"], 6):  # tolerancia 6 px
				if event.button_index == MOUSE_BUTTON_LEFT:
					seg["color"] = Color.BLACK
				elif event.button_index == MOUSE_BUTTON_RIGHT:
					seg["color"] = Color.GRAY
				queue_redraw()
				break


func _is_near_segment(point: Vector2, a: Vector2, b: Vector2, tolerance: float) -> bool:
	var ab = b - a
	var ap = point - a
	var t = clamp(ap.dot(ab) / ab.length_squared(), 0.0, 1.0)
	var closest = a + ab * t
	return point.distance_to(closest) <= tolerance
