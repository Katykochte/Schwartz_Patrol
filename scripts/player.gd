extends CharacterBody2D

@export var grid_size: int = 64
var is_moving := false

func move_in_direction(direction: Vector2) -> bool:
	if is_moving:
		return false

	is_moving = true
	var target_position = position + direction * grid_size

	var viewport_size = get_viewport().get_visible_rect().size

	var half_width = 0.0
	if has_node("Sprite2D") and $Sprite2D.texture:
		var tex: Texture2D = $Sprite2D.texture
		half_width = tex.get_size().x * $Sprite2D.scale.x * 0.5
	else:
		
		half_width = 32.0

	target_position.x = clamp(target_position.x, half_width, viewport_size.x - half_width)

	target_position.y = position.y

	position = target_position
	is_moving = false
	return true
