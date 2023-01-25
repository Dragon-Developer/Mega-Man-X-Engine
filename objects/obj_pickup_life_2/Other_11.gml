event_inherited();
if (is_on_floor() && animation_end)
	animation_play("L");

if (heart_id != -1 && global.heart_used[heart_id])
	instance_destroy();