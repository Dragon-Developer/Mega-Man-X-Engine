var _x = x, _y = y;

for(var i = 2; i >= 0; i--)
{
	var pos = trail_pos[i];
	image_index = (i == 0);
	x = pos[0];
	y = pos[1];
	draw_self_fixed();
}
x = _x;
y = _y;