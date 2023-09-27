extends Sprite2D

var velocity : Vector2 = Vector2.ZERO;
@export var speed : float = 100;
@export var acceleration : float = 20;
@export var drag : float = 50;
@export var laserPrefab : Node2D;


# Called when the node enters the scene tree for the first time.
@onready var timer = $Timer as Timer

func _ready():
	play("default")

const speed = 30


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_walk(delta)


func _on_timer_timeout():
	_fire()

		
func _walk(delta):
	var x : float = 0
	var y : float = 0
	
	if Input.is_action_pressed("ui_right"):
		x += speed
	if Input.is_action_pressed("ui_left"):
		x -= speed
	if Input.is_action_pressed("ui_up"):
		y -= speed
	if Input.is_action_pressed("ui_down"):
		y += speed
		
	if x == 0 && y == 0:
		velocity = velocity.move_toward(Vector2.ZERO,delta * drag);
	else:
		velocity = velocity.move_toward(Vector2(x,y),delta * acceleration)
	
	position += velocity * delta
	
	
func _fire():
	var n = laserPrefab.duplicate() as Sprite2D
	n.set_visible(true)
	n.position = position
	get_parent().add_child(n)

