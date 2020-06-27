/*var block_left = instance_place(x - 8, y, obj_square_parent);
var _movex = false;
if (instance_exists(block_left))
{
	_movex = true;
	show_debug_message("slope (" + string(x) + ", " + string(y) + ") move block (" + string(block_left.x) + ", " + string(block_left.y) + ")");
	block_left.x -= 8;
	block_left.image_xscale -= 0.5;
}
else
{
	var slope_left = instance_place(x - 8, y, obj_slope_parent);
	if (slope_left)
	{
		y += 8/image_xscale;	
	}
	else
	{
		_movex = true;	
	}
}
if (_movex) x -= 8;*/