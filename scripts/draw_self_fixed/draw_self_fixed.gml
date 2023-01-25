function draw_self_fixed(spr = sprite_index, ind = image_index, _x = floor(x), _y = floor(y)) {
	if (sprite_exists(spr)) {
		draw_sprite_ext(spr, ind, _x, _y, image_xscale, image_yscale, image_angle, noone, image_alpha);
	}
}
