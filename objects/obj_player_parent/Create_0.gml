//Armor check for capsules;
armor_check = 0;
player_start();
limit_x = [floor((bbox_right - bbox_left) / 2), room_width - floor((bbox_right - bbox_left) / 2)];
limit_y = floor((bbox_bottom - bbox_top) / 2);
function player_draw_event() {
	var size = ds_list_size(trail_sprites);
	if (size > 0) {
		var trail_limit = floor(1 / trail_speed);
		if (trail_mode == 0) {
			gpu_set_fog(true, trail_color, 0, 0);	
		}
		for (var i = size - 2; i > 0; i--) {
			var tr = trail_sprites[| i];
			if (i mod trail_limit == 0) {
				player_draw_trail_sprite(tr.sprite, tr.index, tr.x - x + floor(x), tr.y, tr.xs, tr.ys, lerp(0.2, 1, i / trail_size), (trail_mode == 1 ? trail_color : c_white));
			}
		}
		gpu_set_fog(false, c_black, 0, 0);
	}
	var _x = x, _y = y;
	if (state == states.ride) {
		_x = ride_char_pos.x;
		_y = ride_char_pos.y;	
		if (ride_inst != noone) {
			if (!ride_inst.visible) exit;
			with (ride_inst) {
				if (sprite_exists(sprite[1])) {
					draw_set_damage_effect(true);
					draw_sprite_ext(sprite[1], image_index, floor(x), floor(y), xscale, 1, 0, c_white, 1);
					draw_set_damage_effect(false);
				}
			}
		}
	}
	player_draw_effect(effects.bottom);
	palette_shader();
	player_draw_sprite(_x, _y);

	shader_reset();
}