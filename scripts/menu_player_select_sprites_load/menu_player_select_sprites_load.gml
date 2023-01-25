function menu_player_select_sprites_load() {
	//G.player_select_sprite[pl_char.x, x_armor.none]
	// For each character
	for (var c = 0; c < pl_char.length; c++) {
		var character_name = G.character_name[c];
		if (c < array_length(G.character_armor)) {
			var armors = G.character_armor[c];
			var armors_length = array_length(armors);
			if (armors_length == 0) {
				armors = [""];
				armors_length++;	
			}
			for (var i = 0; i < armors_length; i++) {
				var asset_index = -1;
				var _sprite_name = "spr_player_" + character_name;
				if (i != 0) {
					_sprite_name += "_" + armors[i];
				}
				asset_index = asset_get_index(_sprite_name);
				if (asset_index == -1)
					asset_index = noone;
				G.player_select_sprite[c, i] = asset_index;
			}
		}
	}
	/*
	for (var i = 1; i < x_armor.length; i++) {
		if (i == x_armor.x4_1) continue;
		if (G.player_select_sprite[pl_char.x, i] != noone) {
			if (G.armor_is_mixable[pl_char.x, i]) {
				G.character_armor_unlocked[pl_char.x, i] = [false, true, true, true, true, false];
			} else {
				G.character_armor_unlocked[pl_char.x, i] = [false, false, false, false, false, true];	
			}
		} else {
			G.character_armor_unlocked[pl_char.x, i] = [false, false, false, false, false, false];
		}
	}
	//G.character_armor_unlocked[pl_char.x, x_armor.x3] = [false, true, true, true, true, false];
	G.character_armor_unlocked[pl_char.x, x_armor.shadow] = [false, false, false, false, false, false];
	//G.character_armor_unlocked[pl_char.x, x_armor.x4] = [false, false, false, false, false, false];
	G.character_armor_unlocked[pl_char.x, x_armor.x3_s] = [false, false, false, false, false, false];
	G.character_armor_unlocked[pl_char.x, x_armor.falcon] = [false, false, false, false, false, true];
	*/


}
