/// @description Step
event_inherited();
if (destroy)
{
	var t = destroy_t - 1;
	if (t >= 4)
	{
		instance_destroy();
		exit;
	}
}
else
{
	if (shot_rotate) {
		if (index > 24) index = 11;
		var t = index;
		var _offset = offsets[index++];
		if (!instance_exists(shot_parent) && (index == 12) && ds_exists(shots_group, ds_type_list)) {
			for (var i = 0; i < ds_list_size(shots_group); i++) {
				var shot = shots_group[| i];
				if (instance_exists(shot) && shot.object_index == object_index)
					shot.shot_rotate = false;
			}
		}
		else {
			x += _offset[0] * dir;
			y += _offset[1] * dir;
			if (t > 20) depth = depths[1];
			else if (t > 13) depth = depths[0];
			else if (t > 5) depth = depths[1];
			else depth = depths[0];
		}
	}
	else {
		abs_hspeed = 8;	
		h_speed = abs_hspeed * dir;
	}
}
scr_physics_update();

if (destroy && destroy_t == 1) exit;

for(var i = 4; i > 0; i--)
{
	trail_pos[i] = trail_pos[i - 1];
}

trail_pos[0] = [x, y];