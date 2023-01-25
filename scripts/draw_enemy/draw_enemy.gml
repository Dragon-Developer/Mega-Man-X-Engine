function draw_enemy() {
	if (normal_alpha > 0)
		draw_sprite_ext(sprite_index, floor(image_index), floor(x), floor(y), xscale, 1, 0, normal_color, normal_alpha);
	if (fade_alpha > 0)
		draw_sprite_ext(sprite_index, floor(image_index), floor(x), floor(y), xscale, 1, 0, fade_color, fade_alpha);
}
