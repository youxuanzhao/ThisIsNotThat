extends Camera2D

@export var follownode : Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print_debug($"./".position)
	position = position.move_toward(follownode.position,delta * 10 * (follownode.position - position).length())
