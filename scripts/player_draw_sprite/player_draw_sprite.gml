/// @function player_draw_sprite()
/// @description Draw Player Sprite with the given arguments
/// @param x
/// @param y
/// @param xscale
/// @param yscale
function player_draw_sprite(_x = x, _y = y, xs = xscale, ys = y_dir, index = floor(image_index)) {
	for (var j = 0; j < array_length(armor_current_order) - 1; j++) {
		var i = armor_current_order[j];
		var p = armor_part_parent[i];
		if (sprite_exists(pl_sprite[i]) && pl_sprite[i] != noone) {
			if (light <= 0) {
				plt_source_index = armor_palette_index[p];
				if (plt_index == 0)
					plt_index = plt_index_default;
				palette_shader();
			} else {
				scr_shader_set(shader_palette_light);	
			}
			draw_sprite_ext(pl_sprite[i], index, floor(_x), floor(_y), xs, ys, 0, noone, 1);
			palette_reset();
		}
	}
}

/// @function player_draw_trail_sprite()
/// @param sprite
/// @param index
/// @param x
/// @param y
/// @param xscale
/// @param yscale
function player_draw_trail_sprite(sprite, index = floor(image_index), _x = x, _y = y, xs = xscale, ys = y_dir, alpha = 1, color = c_white) {	
	if (sprite_exists(sprite) && sprite != noone) {
		draw_sprite_ext(sprite, index, floor(_x), floor(_y), xs, ys, 0, color, alpha);
	}
}