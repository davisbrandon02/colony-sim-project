extends Node2D

var placing = load("res://data/building/House.tres")

@onready var grid: Grid = $Grid

func _ready():
	grid.generate_grid()

func _process(delta):
	var placingGridPos = grid.world_to_grid(get_global_mouse_position())
	$PlacingSprite.position = grid.grid_to_world(placingGridPos)
	$PlacingSprite.texture = placing.texture

var blg = preload("res://objects/Building.tscn")
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and placing != null and event.pressed:
		var grid_pos = grid.world_to_grid($PlacingSprite.position)
		if grid.grid.has(grid_pos) and grid.grid[grid_pos] == null:
			print('placing %s at %s' % [placing.name, $PlacingSprite.position])
			var blgi = blg.instantiate()
			blgi.data = placing
			blgi.pos = grid_pos
			grid.add_child(blgi)

func _on_house_button_pressed():
	placing = preload("res://data/building/House.tres")

func _on_house_2x_2_button_pressed():
	placing = preload("res://data/building/House2x2.tres")
