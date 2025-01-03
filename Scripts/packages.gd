extends Node2D

var idx = -1

func _ready():
	visible = false
	
func show_package(idx):
	self.idx = idx
	visible = true
	$Sprite2D.region_rect.position = Vector2(idx * 16,0)
	
func hide_package():
	idx = -1
	visible = false
