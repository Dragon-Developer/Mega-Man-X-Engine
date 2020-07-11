sprite_str = ds_map_create(); // idle, walk, ...

for (var k = ds_map_find_first(animations_sprite_name); !is_undefined(k); k = ds_map_find_next(animations_sprite_name, k))
{
	sprite_str[? k] = animations_sprite_name[? k];
}

sprite_shoot_str = ds_map_create(); // idle_shoot, walk_shoot, ...

for (var k = ds_map_find_first(sprite_str); !is_undefined(k); k = ds_map_find_next(sprite_str, k))
{
	sprite_shoot_str[? k] = sprite_str[? k] + "_shoot";
}

for (var k = ds_map_find_first(sprite_str); !is_undefined(k); k = ds_map_find_next(sprite_str, k))
{
	sprite_str[? k] = "spr_" + char_name + "_" + sprite_str[? k]; // spr_player_action
	sprite_shoot_str[? k] = "spr_" + char_name + "_" + sprite_shoot_str[? k]; // spr_player_action_shoot
	// If this armor can only be used when full
	if (armor[P_FULL] != "")
	{
		sprite_str[? k] += "_" + armor[P_FULL]; // spr_player_action_armor
		sprite_shoot_str[? k] += "_" + armor[P_FULL]; // spr_player_action_shoot_armor 
	}
}

my_sprites = ds_list_create();
my_sprites_shoot = ds_list_create();

for (var i = 0; i <= P_FULL; i++)
{
	my_sprites[| i] = ds_map_create();
	my_sprites_shoot[| i] = ds_map_create();
}

parts_name[P_OG] = "";
parts_name[P_LEGS] = "legs";
parts_name[P_BODY] = "body";
parts_name[P_ARMS] = "arms";
parts_name[P_HELM] = "helm";

for (var l = 0; l < 2; l++)
{
	var sprite_map = l ? sprite_shoot_str : sprite_str;
	
	for (var k = ds_map_find_first(sprite_map); !is_undefined(k); k = ds_map_find_next(sprite_map, k))
	{
		var _sprite_name = sprite_map[? k]; // spr_x_walk or spr_x_walk_shoot
		
		if (asset_get_index(_sprite_name) != -1)
		{
			for (var j = 0; j < 5; j++) // For each armor part
			{
				var sprite_armor_name = _sprite_name;
				
				if (armor[j] != "") sprite_armor_name = _sprite_name + "_" + armor[j]; // spr_x_walk_x2
				
				var sprite_to_add = noone;
				var sprite_to_add_name = "";
				
				if (j > 0 && armor[P_FULL] == "")
				{
					sprite_to_add_name = sprite_armor_name + "_" + parts_name[j]; // spr_x_walk_x2_legs or spr_x_walk_shoot_x2_legs
				}
				else if (armor[P_FULL] != "")
				{
					sprite_to_add_name = sprite_armor_name; // spr_x_walk_x2
				}
				else if (j == 0)
				{
					sprite_to_add_name = _sprite_name; // spr_x_walk
				}
				
				sprite_to_add = asset_get_index(sprite_to_add_name);
				
				var map = (sprite_map == sprite_str) ? my_sprites[| j] : my_sprites_shoot[| j];
				
				map[? k] = noone;
				
				if (sprite_to_add != -1)
				{
					map[? k] = sprite_to_add;
					log("Added sprite " + sprite_to_add_name);
				}
				else if (sprite_to_add_name != "" && (armor[j] != "" || j == 0))
				{
					if (l == 1) // shoot
					{
						var map2 = my_sprites[| j];
						map[? k] = map2[? k];
					}
					
					if (map[? k] == noone)
					{
						log("Couldn't find sprite " + sprite_to_add_name);
					}
				}
			}
		}
		// This sprite doesn't exists but maybe it's only for a full armor
		// Example: There is no spr_x_shoryuken, but there is spr_x_shoryuken_x2
		else
		{
			var check_armor = armor[P_LEGS];
			if (check_armor != "" && armor_is_full(check_armor))
			{
				var sprite_armor_name = _sprite_name + "_" + check_armor; // spr_x_shoryuken_x2
				var sprite_to_add = asset_get_index(sprite_armor_name);
				
				var map = (sprite_map == sprite_str) ? my_sprites[| 0] : my_sprites_shoot[| 0];
				map[? k] = noone;
				
				if (sprite_to_add != -1)
				{
					map[? k] = sprite_to_add;
					log("Added sprite " + sprite_armor_name);
				}
				else if (sprite_armor_name != "")
				{
					if (l == 1) // shoot
					{
						var map2 = my_sprites[| 0];
						map[? k] = map2[? k];
					}
					
					if (map[? k] == noone)
					{
						log("Couldn't find sprite " + sprite_armor_name);
					}
				}
			}
		}
	}
}
