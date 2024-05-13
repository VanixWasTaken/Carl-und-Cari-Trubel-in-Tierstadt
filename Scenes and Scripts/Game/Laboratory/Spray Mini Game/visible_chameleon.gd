extends AnimatedSprite2D


var shader_value = material.get_shader_parameter("value")
var speed = 0.01

func _physics_process(delta):
	if(Input.is_action_pressed("ui_accept")):
		shader_value += speed
	
	shader_value = clamp(shader_value, 0.0, 1.0)
	
	material.set_shader_parameter("value", shader_value)
