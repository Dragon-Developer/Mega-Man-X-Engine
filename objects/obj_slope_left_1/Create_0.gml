/*var block_right = instance_place(x + 8, y, obj_square_parent);

var _movex = false;
if (instance_exists(block_right))
{
	x += 8;
	_movex = true;
	show_debug_message("slope (" + string(x) + ", " + string(y) + ") move block (" + string(block_right.x) + ", " + string(block_right.y) + ")");
	block_right.x += 8;
	block_right.image_xscale -= 0.5;
}
else
{
	var slope_right = instance_place(x + 8, y, obj_slope_parent);
	if (slope_right)
	{
		y += 8/image_xscale;	
	}
	else
	{
		_movex = true;	
	}
}
if (_movex) x += 8;*/