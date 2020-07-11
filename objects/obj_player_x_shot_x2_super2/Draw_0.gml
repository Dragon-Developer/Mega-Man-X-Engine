var _x = x, _y = y;

for(var i = 3; i >= 0; i--)
{
	var pos = trail_pos[i];
	image_index = i div 2;
	x = pos[0];
	y = pos[1];
	draw_self_fixed();
}
x = _x;
y = _y;