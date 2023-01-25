function sprite_fix_origin(spr) {
	if (sprite_exists(spr) && sprite_get_xoffset(spr) == undefined_sprite_origin.x && sprite_get_yoffset(spr) == undefined_sprite_origin.y)
		sprite_set_offset(spr, default_sprite_origin.x, default_sprite_origin.y);	
}
function player_load_sprites() {
	ds_map_clear(sprite_str); // idle, walk, ...

	for (var k = ds_map_find_first(animations_sprite_name); !is_undefined(k); k = ds_map_find_next(animations_sprite_name, k)) {
		sprite_str[? k] = animations_sprite_name[? k];
	}

	ds_map_clear(sprite_shoot_str); // idle_shoot, walk_shoot, ...

	for (var k = ds_map_find_first(sprite_str); !is_undefined(k); k = ds_map_find_next(sprite_str, k)) {
		sprite_shoot_str[? k] = sprite_str[? k] + "_shoot";
	}

	for (var k = ds_map_find_first(sprite_str); !is_undefined(k); k = ds_map_find_next(sprite_str, k)) {
		sprite_str[? k] = "spr_" + char_name + "_" + sprite_str[? k]; // spr_player_action
		sprite_shoot_str[? k] = "spr_" + char_name + "_" + sprite_shoot_str[? k]; // spr_player_action_shoot
	}
	for (var i = 0; i <= P_EXT4; i++) {
		ds_map_clear(my_sprites[| i]);
		ds_map_clear(my_sprites_shoot[| i]);
	}

	parts_name[P_OG] = "";
	parts_name[P_LEGS] = "legs";
	parts_name[P_BODY] = "body";
	parts_name[P_ARMS] = "arms";
	parts_name[P_HELM] = "helm";
	parts_name[P_FULL] = "_";
	parts_name[P_EXT1] = "ext1";
	parts_name[P_EXT2] = "ext2";
	parts_name[P_EXT3] = "ext3";
	parts_name[P_EXT4] = "ext4";

	for (var l = 0; l < 2; l++) {
		var sprite_map = l ? sprite_shoot_str : sprite_str;
	
		for (var k = ds_map_find_first(sprite_map); !is_undefined(k); k = ds_map_find_next(sprite_map, k)) {
			var _sprite_name = sprite_map[? k]; // spr_x_walk or spr_x_walk_shoot
		
			if (FULL == "") {
				if (asset_get_index(_sprite_name) != -1) {
					// For each armor part
					for (var j = 0; j <= P_EXT4; j++) {
						var sprite_armor_name = _sprite_name;
						var t_armor = "";
						if (armor_part_parent[j] < array_length(armor)) {
							t_armor = string_replace(armor[armor_part_parent[j]], "_s", "");
							if (t_armor != "")
								sprite_armor_name = _sprite_name + "_" + t_armor; // spr_x_walk_x2
						} else t_armor = "_";
						var sprite_to_add = noone;
						var sprite_to_add_name = "";
				
						if (j == 0) {
							sprite_to_add_name = _sprite_name; // spr_x_walk
						} else {
							sprite_to_add_name = sprite_armor_name + "_" + parts_name[j]; // spr_x_walk_x2_legs or spr_x_walk_shoot_x2_legs
						}
				
						sprite_to_add = asset_get_index(sprite_to_add_name);
				
						var map = (sprite_map == sprite_str) ? my_sprites[| j] : my_sprites_shoot[| j];
				
						map[? k] = noone;
				
						if (sprite_to_add != -1) {
							map[? k] = sprite_to_add;
							log("Added sprite " + sprite_to_add_name);
						} else if (sprite_to_add_name != "" && (t_armor != "" || j == 0)) {
							// Shoot
							if (l == 1) {
								var map2 = my_sprites[| j];
								map[? k] = map2[? k];
							}
					
							if (map[? k] == noone && j < P_EXT1) {
								log("Couldn't find sprite " + sprite_to_add_name);
							}
						}
						sprite_fix_origin(map[? k]);
					}
				}
				// This sprite doesn't exists but maybe it's only for a full armor
				// Example: There is no spr_x_shoryuken, but there is spr_x_shoryuken_x2
				else {
					var check_armor = armor[P_LEGS];
					if (check_armor != "" && armor_is_full(check_armor)) {
						var sprite_armor_name = _sprite_name + "_" + check_armor; // spr_x_shoryuken_x2
						var sprite_to_add = asset_get_index(sprite_armor_name);
				
						var map = (sprite_map == sprite_str) ? my_sprites[| 0] : my_sprites_shoot[| 0];
						map[? k] = noone;
				
						if (sprite_to_add != -1) {
							map[? k] = sprite_to_add;
							log("Added sprite " + sprite_armor_name);
						} else if (sprite_armor_name != "") {
							// Shoot
							if (l == 1) {
								var map2 = my_sprites[| 0];
								map[? k] = map2[? k];
							}
						
							if (map[? k] == noone) {
								log("Couldn't find sprite " + sprite_armor_name);
							}
						}
						sprite_fix_origin(map[? k]);
					}
				}
			} else {
				var sprite_armor_name = _sprite_name + "_" + FULL;
				
				var test_armor = asset_get_index(sprite_armor_name);
				var test_normal = asset_get_index(_sprite_name);
				
				if (test_armor > -1) {
					player_map_sprite_set(test_armor, sprite_map, k, P_OG);
					log("Added " + sprite_armor_name);
				} else {
					player_map_sprite_set(test_normal, sprite_map, k, P_OG);
					log("Added " + _sprite_name);
				}
			}
		}
	}



}
