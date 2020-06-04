if (!instance_exists(_target)) exit;

var new_x, new_y;
new_x = floor(_target.x) - _width / 2;
new_y = floor(_target.y) - _height / 2;

new_x = clamp(new_x, 0, room_width - _width);
new_y = clamp(new_y, 0, room_height - _height);

if (new_x != x)
{
	if (abs(new_x - x) >= 6)
	{
		x += 6 * sign(new_x - x);
	}
	else
	{
		x = new_x;	
	}
}

if (new_y != y)
{
	if (abs(new_y - y) >= 6)
	{
		y += 6 * sign(new_y - y);
	}
	else
	{
		y = new_y;	
	}
}

mid_x = x + _width / 2;
mid_y = y + _height / 2;

if (instance_exists(obj_player_ready))
{
	obj_player_ready.x = mid_x;
	obj_player_ready.y = mid_y;
}
camera_set_view_pos(view_camera[0], x, y);