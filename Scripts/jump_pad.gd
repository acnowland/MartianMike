extends Area2D

@onready var animation = $AnimatedSprite2D
@export var jump_force = 300
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if(body is Player):
		body.jump(jump_force)
		animation.play("jump")
