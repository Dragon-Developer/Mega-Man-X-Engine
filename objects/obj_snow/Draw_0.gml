var v = view_get_rectangle();
if (is_inside_view(v))
	draw_sprite_tiled_area(sprite_index, image_index, x, y, max(x, v[0]), max(y, v[1]), min(x + sprite_width, v[2]), min(y + sprite_height, v[3]));
