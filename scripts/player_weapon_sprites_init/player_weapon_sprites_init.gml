function player_weapon_sprites_init() {
	// Ex: Used for Axl to cover his sprite with a weapon 
	weapon_overlay_sprite = noone;
	weapon_overlay_sprite_map = ds_map_create();
	weapon_overlay_name = "";
	weapon_overlay_enabled = false;
	if (argument_count > 0) weapon_overlay_name = argument[0];
	if (weapon_overlay_name == "") exit;
	weapon_overlay_enabled = true;
	var map_name = animations_sprite_name;
	// For each sprite name
	for (var k = ds_map_find_first(map_name); !is_undefined(k); k = ds_map_find_next(map_name, k)) {
		var spr = "spr_" + char_name + "_" + map_name[? k] + "_" + weapon_overlay_name;
		var index = asset_get_index(spr);
		// If this sprite exists
		if (index != -1) {
			log("Added " + spr);	
		} else {
			// Couldn't find the sprite
			index = noone;
			log("Couldn't add " + spr);	
		}
		weapon_overlay_sprite_map[? map_name[? k]] = index;
	}


}
