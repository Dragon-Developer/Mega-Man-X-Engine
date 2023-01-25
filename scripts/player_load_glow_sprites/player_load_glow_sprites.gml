function player_glow_init() {
	glow_sprite = noone;
	glow_sprite_map = ds_map_create();
	glow_sprite_map_shoot = ds_map_create();
	glow_alpha = 1;
	glow_enabled = false;
	glow_name = "glow";
	glow_mode = 0;
	glow_on_light = false;
	glow_type = 0;
	glow_timer = 0;
	glow_length = 30;
	glow_alpha2 = 0;
}
function player_glow_load() {
	if (!glow_enabled || glow_name == "") exit;
	var map_name = animations_sprite_name;
	// For each sprite name
	for (var k = ds_map_find_first(map_name); !is_undefined(k); k = ds_map_find_next(map_name, k)) {
		var spr = "spr_" + char_name + "_" + glow_name + "_" + map_name[? k];
		var index = asset_get_index(spr);
		// If this sprite doesn't exist
		if (index == -1)
			index = noone;
		else
			sprite_fix_origin(index);
		glow_sprite_map[? map_name[? k]] = index;
		index = asset_get_index(spr + "_shoot");
		// If this sprite doesn't exist
		if (index == -1)
			index = glow_sprite_map[? map_name[? k]];
		else
			sprite_fix_origin(index);
		glow_sprite_map_shoot[? map_name[? k]] = index;
	}
}