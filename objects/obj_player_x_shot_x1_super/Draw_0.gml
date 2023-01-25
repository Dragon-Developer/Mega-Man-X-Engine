var _x = x, _y = y;

for (var i = 8; i >= 0; i--) {
	var pos = trail_pos[i];
	var _draw = true;
	switch(i){
		case 8: image_index = 5; break;
		case 6:
		case 4: image_index = 4; break;
		case 2: image_index = 3; break;
		case 0: image_index = animation_i; break;
		default: _draw = false;
	}
	x = pos[0];
	y = pos[1];
	if (_draw && pos[2])
		draw_self_fixed();
}
x = _x;
y = _y;