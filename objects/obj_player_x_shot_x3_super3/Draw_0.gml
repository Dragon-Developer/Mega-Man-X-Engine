var _x = x, _y = y;

for(var i = 2; i >= 0; i--)
{
	var pos = trail_pos[i];
	if (pos[2]) {
		image_index = (i == 1);
		if (i == 0)
			image_index = animation_i;
		x = pos[0];
		y = pos[1];
		draw_self_fixed();
	}
}
x = _x;
y = _y;