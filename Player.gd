extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var counter = 0.3
var i = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	counter -= delta
	if counter < 0:
		region_rect.position.x += region_rect.size.x
		i += 1
		if i == 5:
			region_rect.position.x = 0
			i = 0
		counter = 0.3
