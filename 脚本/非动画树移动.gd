extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


var angle = 0
var target = position
var speed = 300
var can = true
func _ready():
	pass
func _physics_process(_delta):
	move()
	update_animation()
	
	
func move():
	if target != self.position and can:
		if position.distance_to(target) > 10:
			velocity = (target - self.position).normalized() * speed
		else:
			velocity = Vector2.ZERO
	move_and_slide()
	
func update_animation() -> void:
	var mouse = to_local(target)
	angle = snappedf(mouse.angle(), PI / 4) / (PI / 4)
	angle = wrapi(int(angle), 0, 8)
	#animated_sprite_2d.animation = "walk" + str(angle)
	if velocity.length() != 0:
		animated_sprite_2d.play("walk" + str(angle))
		
	else:
		animated_sprite_2d.stop()
		animated_sprite_2d.frame = 1
		if Input.is_action_pressed("click2"):
			target = get_global_mouse_position()
			can = false
			animated_sprite_2d.animation = "idle" + str(angle)
		
#func _input(event):
	if Input.is_action_pressed("click"):
		target = get_global_mouse_position()
		can = true
	
		
	
	
	
	

	




