function player_x_animation_controller() {
	if (animation != "") {
		for (var i = 0; i <= P_EXT4; i++) {
			if (i == P_FULL) continue;
			pl_sprite[i] = noone;
	
			var map1 = my_sprites[| i], map2 = my_sprites_shoot[| i];
	
			if (shoot && ds_map_exists(map2, animation)) {
				pl_sprite[i] = map2[? animation];
			} else if (ds_map_exists(map1, animation)) {
				pl_sprite[i] = map1[? animation];
			}
		}
		weapon_overlay_sprite = noone;
		if (weapon_overlay_enabled) {
			if (ds_map_exists(weapon_overlay_sprite_map, animation_sprite_name))
				weapon_overlay_sprite = weapon_overlay_sprite_map[? animation_sprite_name];
		}
		glow_sprite = noone;
		if (glow_enabled) {
			if (!shoot) {
				if (ds_map_exists(glow_sprite_map, animation_sprite_name))
					glow_sprite = glow_sprite_map[? animation_sprite_name];
			} else {
				if (ds_map_exists(glow_sprite_map_shoot, animation_sprite_name))
					glow_sprite = glow_sprite_map_shoot[? animation_sprite_name];
			}
		}
		if (ds_map_exists(armor_order_map, animation_sprite_name))
			armor_current_order = armor_order_map[? animation_sprite_name];
		else
			armor_current_order = armor_order_map[? ""];
	}
	if (global.pause_type == pause_types.door ||
		global.pause_type == pause_types.special_attack ||
		!global.paused) {
		animation_update();
		if (trail_sprites_enabled && state != states.ride) {
			ds_list_add(trail_sprites, {
				sprite: pl_sprite[0],
				index: animation_i,
				x: x,
				y: y,
				xs: xscale,
				ys: y_dir
			});
		}
		if ((trail_sprites_remove || state == states.ride) && ds_list_size(trail_sprites)) {
			ds_list_clear(trail_sprites);
		}
		else if (ds_list_size(trail_sprites) > trail_size) {
			ds_list_delete(trail_sprites, 0);
		}
	}
	image_index = animation_i;
	if (instance_exists(saber)) {
		saber.visible = false;
		saber.image_index = image_index;
	}
	if (ds_map_exists(saber_sprite, animation_sprite_name)) {
		if (instance_exists(saber)) {
			saber.sprite_index = saber_sprite[? animation_sprite_name];
			if (image_index < sprite_get_number(saber.mask_index))
				saber.visible = true;
		}
	}


}
