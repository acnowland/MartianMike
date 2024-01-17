# Martian Mike

Welcome to Martian Mike, an exciting side-scrolling game created with the Godot Engine using Godot Script. This project marks my first venture into developing a larger game, and along the way, I've gained valuable insights into various Godot features. This game is based on a class provided by GameDev.Tv and has been a wonderful learning experience.

## Overview

Martian Mike is a work in progress, featuring a side-scrolling gameplay experience with multiple levels. As I navigate through the development process, I've encountered challenges and learned how to leverage key Godot functionalities.

## Learning Experience

### Godot Tile Map System

One of the highlights of this project is the utilization of the Godot tile map system. This powerful feature has allowed me to efficiently design and create diverse levels within the game. It has significantly streamlined the process of constructing the game world and contributed to a more structured development approach.

### Signals

Implementing signals in Martian Mike has been a game-changer. Signals in Godot facilitate communication between different nodes, enhancing modularity and reducing dependencies. This approach has improved the overall organization of the codebase and made it easier to manage interactions between game elements.

### Animation

Animation is a crucial aspect of any game, and Martian Mike is no exception. I've delved into Godot's animation system to bring life to characters and movements. Learning to synchronize animations with player actions and environmental changes has been a rewarding experience, adding a layer of polish to the game.

## Code Snippets

Here are some example code chunks that showcase the core mechanics of Martian Mike and how I handled gravitational + jumping forces:

```
extends CharacterBody2D
class_name Player

@export var gravity = 400
@export var speed = 125
@export var jump_force = 200

@onready var animation = $AnimatedSprite2D

func _ready():
    # Initialization code here

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
```

### Work in Progress

Martian Mike is an ongoing project, and I'm continuously working to enhance and expand the game. Your feedback and contributions are welcome as we embark on this exciting journey together.
Feel free to explore the code, try out the game, and join me in shaping Martian Mike into an engaging gaming experience. Thank you for being a part of this adventure!



