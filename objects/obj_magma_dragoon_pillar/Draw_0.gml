draw_sprite_part(spr_lava_top, image_index, 0, 0, sprite_get_width(spr_lava_top), min(sprite_height, base_y - y), x-8, y);
var v = view_get_rectangle();
var _yy = y + 24;
while (_yy < base_y) {
	if (rectangle_in_rectangle(x, _yy, x + sprite_width, _yy + sprite_height, v[0], v[1], v[2], v[3])) {
		draw_sprite_part(sprite_index, image_index, 0, 0, sprite_width, min(sprite_height, base_y - _yy), x, _yy);
	}
	_yy += 24;
}