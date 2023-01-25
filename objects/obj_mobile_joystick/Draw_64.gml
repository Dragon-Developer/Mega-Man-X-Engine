event_inherited();
if (global.settings[settings_types.input] == input_types.keyboard) {
	draw_sprite_ext(sprite_index, 2, draw_x, draw_y, image_xscale, image_yscale, 0, c_white, image_alpha);
	draw_sprite_ext(sprite_index, 1, draw_x + circle_x, draw_y + circle_y, image_xscale, image_yscale, 0, c_white, image_alpha);
}