extends CharacterBody2D
class_name Player


@export var gravity = 400
@export var speed = 125
@export var jump_force = 200

@onready var animation = $AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	if(!is_on_floor()):
		if(!(velocity.y > 500)):
			velocity.y += gravity * delta
	
	if (Input.is_action_just_pressed("jump") && is_on_floor()):
		jump(jump_force)
		
	var direction = Input.get_axis("move_left", "move_right")
	if(direction != 0):
		animation.flip_h = (direction == -1)

	
	velocity.x = direction * speed
	update_animations(direction)
	move_and_slide()
	
	
func update_animations(direction):
	if(is_on_floor()):
		if direction == 0:
			animation.play("idle")
		else:
			animation.play("run")
	else:
		if(velocity.y < 0):
			animation.play("jump")
		else:
			animation.play("fall")

func jump(force):
	velocity.y = -force
