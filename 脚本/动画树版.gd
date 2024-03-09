extends CharacterBody2D


@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animation_tree: AnimationTree = $AnimationTree


var target = position
var speed = 300
var can = true
var is_moving := false

func _ready() -> void:
	animation_tree.active = true

func _physics_process(_delta: float) -> void:
	move()
	update_animation()

func move() -> void:
	if target != self.position and can:
		if position.distance_to(target) > 10:
			velocity = (target - self.position).normalized() * speed
		else:
			velocity = Vector2.ZERO
	move_and_slide()
	
func update_animation() -> void:
	if velocity.length() != 0:
		is_moving = true
		animation_tree["parameters/idle/blend_position"] = velocity.normalized()
		animation_tree["parameters/move/blend_position"] = velocity.normalized()
	else:
		is_moving = false
		#animation_tree["parameters/idle/blend_position"] = velocity.normalized()
		if Input.is_action_pressed("click2"):
			target = get_global_mouse_position()
			can = false
		#is_moving = false
			animation_tree["parameters/idle/blend_position"] = velocity.normalized()
			#animation_tree["parameters/move/blend_position"] = velocity.normalized()
			#print(1)
			
			
	if Input.is_action_pressed("click"):
		target = get_global_mouse_position()
		can = true
