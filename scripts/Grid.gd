class_name Grid
extends Node2D

var grid: Dictionary = {}

@export var grid_size_x: int = 30
@export var grid_size_y: int = 30
@export var cell_size: int = 64

func generate_grid() -> void:
	for x in grid_size_x:
		for y in grid_size_y:
			grid[Vector2(x,y)] = null
			var label = Label.new()
			label.text = str(Vector2(x,y))
			label.position = grid_to_world(Vector2(x,y))
			add_child(label)

func world_to_grid(world_coordinates: Vector2) -> Vector2:
	return round(world_coordinates / cell_size)

func grid_to_world(grid_coordinates: Vector2) -> Vector2:
	return grid_coordinates * cell_size

func get_random_pos() -> Vector2:
	var rand_vector: Vector2 = Vector2(randi_range(0, grid_size_y - 1), randi_range(0, grid_size_y - 1))
	if grid[rand_vector] == null:
		return rand_vector
	else:
		return get_random_pos()

func get_tiles_within_range(_pos: Vector2, _range: int):
	pass
