extends Sprite2D


# Called when the node enters the scene tree for the first time.
const speed = 60
var stage = 2
var stage_i = 0.1

func _ready():
	stage = 2
	stage_i = 0.1
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	stage_i -= delta
	if stage_i < 0:
		stage -= 1
		stage = max(stage, 0)
		stage_i = 0.1
		
	region_rect.position.x = region_rect.size.x * stage
	position.x += speed * delta
