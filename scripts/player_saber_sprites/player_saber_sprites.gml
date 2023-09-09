function player_saber_sprites() {
	saber_all_skill_names = [
		"1", "2", "3",
		"jump", "land", "wall", "mikazukizan", "ryuenjin", "hyouretsuzan",
		"shippuuga", "raikousen", "3", "genmu"
	];
	saber_sprite = ds_map_create();
	for (var i = 0; i < array_length(saber_all_skill_names); i++) {
		var skill_name = saber_all_skill_names[i];
		var asset = asset_get_index("spr_" + char_name + "_saber_" + skill_name);
		if (asset != -1) {
			saber_sprite[? "atk_" + skill_name] = asset;	
		}
	}


}
