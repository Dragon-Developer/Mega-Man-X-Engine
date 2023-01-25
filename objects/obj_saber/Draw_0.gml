/// @description Insert description here
// You can write your code in this editor
if (!sprite_exists(sprite_index)) exit;
palette_shader();
draw_sprite_ext(sprite_index,image_index, floor(draw_x), floor(draw_y), image_xscale, image_yscale, 0, noone, 1);
palette_reset();