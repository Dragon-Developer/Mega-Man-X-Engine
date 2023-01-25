/// @description Draw the chosen character with the given armor
/// @param x
/// @param y
/// @param character
/// @param armor_array (optional)
/// @param palette_sprite (optional)
/// @param palette_index (optional)
/// @param palette_source_array (optional)
/// Needs refactoring: make the layer order less hardcoded
function menu_draw_player(x, y, c, armor_array = [0], palette_sprite = noone, palette_index = 0, palette_array = [0, 0, 0, 0, 0, 0]) {
	var sprite;
	if (c >= pl_char.length) exit;
	plt_index = palette_index;
	plt_texture = noone;
	if (palette_sprite != noone)
		palette_texture_set(palette_sprite);
	if (array_length(armor_array) < 2) {
		var sprite = G.player_select_sprite[c][0];
		plt_source_index = palette_array[0];
		palette_shader();
		draw_sprite(sprite, 0, x, y);
		palette_reset();
		exit;
	}
	var i_start = 0, i_end = P_FULL;
	if (armor_array[P_FULL] != 0) {
		i_start = P_FULL;
	} else {
		if (armor_array[0] == 0 && armor_array[1] == 0 && armor_array[2] == 0 && armor_array[3] == 0 && armor_array[4] == 0)
			if (sprite_get_number(G.player_select_sprite[c, 0]) == 1)
				i_end = 0;
	
		var spr_index = G.player_select_sprite[c][armor_array[P_BODY]];
		if (i_end != 0 && sprite_get_number(spr_index) == 5) {
			if (sprite_exists(spr_index)) {
				plt_source_index = palette_array[P_BODY];
				palette_shader();
				draw_sprite(spr_index, 4, x, y);
				palette_reset();
			}
		}
	}
	for (var i = i_start; i <= i_end; i++) {
		var armor_id = armor_array[i];
		if (armor_id >= array_length(G.player_select_sprite[c])) continue;
		var img_index = i;
		if (armor_id > 0) {
			img_index = i - 1;	
		}
		sprite = G.player_select_sprite[c][armor_id];
		if (i == P_FULL && armor_id == 0)
			sprite = noone;
		if (sprite_exists(sprite)) {
			plt_source_index = palette_array[i];
			if (i_start == P_FULL) plt_source_index = palette_array[0];
			palette_shader();
			draw_sprite(sprite, img_index, x, y);
			palette_reset();
		}
	}

}
