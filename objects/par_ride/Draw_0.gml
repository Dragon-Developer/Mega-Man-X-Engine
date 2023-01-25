draw_set_damage_effect(true);
if (sprite_exists(sprite[1]) && !instance_exists(char_instance))
	draw_sprite_ext(sprite[1], image_index, floor(x), floor(y), xscale, 1, 0, c_white, 1);
if (sprite_exists(sprite[0]))
	draw_sprite_ext(sprite[0], image_index, floor(x), floor(y), xscale, 1, 0, c_white, 1);
draw_set_damage_effect(false);