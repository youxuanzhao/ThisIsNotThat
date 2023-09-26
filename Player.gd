extends AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
@onready var timer = $Timer as Timer

func _ready():
	play("default")


const speed = 30

func do_fire():
	if Input.is_action_pressed("Fire"):
		var n = $"../Laser".duplicate() as Sprite2D
		n.set_visible(true)
		$"../".add_child(n)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_left"):
		position.x -= delta * speed

	if Input.is_action_pressed("ui_right"):
		position.x += delta * speed

	if Input.is_action_pressed("ui_up"):
		position.y -= delta * speed

	if Input.is_action_pressed("ui_down"):
		position.y += delta * speed


func _on_timer_timeout():
	do_fire()
