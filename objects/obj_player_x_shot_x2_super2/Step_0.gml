event_inherited();

if (instance_exists(shot_parent))
{
	if (index > 24) index = 11;

	var _offset = offsets[index++];
	x += _offset[0] * dir;
	y += _offset[1];

	var t = index;
	
	if (t > 20) depth = depths[1];
	else if (t > 13) depth = depths[0];
	else if (t > 5) depth = depths[1];
	else depth = depths[0];
}
else
{
	abs_hspeed = 8;	
	h_speed = abs_hspeed * dir;
}
scr_physics_update();

for(var i = 4; i > 0; i--)
{
	trail_pos[i] = trail_pos[i - 1];
}

trail_pos[0] = [x, y];