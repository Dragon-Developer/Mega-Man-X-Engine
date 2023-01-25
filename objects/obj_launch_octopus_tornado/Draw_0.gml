for (var i = 0; i < image_yscale; i++) {
	var _yy = y + 16*i;
	if (rectangle_in_rectangle(x, _yy, x + sprite_width, _yy + sprite_height, vx, vy, vx + vw, vy + vh)) {
		draw_sprite_ext(sprite_index, image_index, x, _yy, image_xscale, 1, 0, c_white, 1);	
	}
}