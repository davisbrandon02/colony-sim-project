class_name Building
extends Area2D

var data: BuildingData
var pos: Vector2
@onready var grid: Grid = get_parent()

func _ready():
	$Sprite.texture = data.texture
	position = grid.grid_to_world(pos)
	print('%s created at %s' % [data.name, pos])
