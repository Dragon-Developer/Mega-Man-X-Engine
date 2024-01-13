// Needs refactoring...
function player_step() {
	local_game_speed_update();
	var executed_keys_update = false;
	if (locked) {
		key_p_jump = false;
		key_p_dash = false;
		key_p_special = false;
		key_p_shoot = false;
		key_p_shoot2 = false;
		key_p_wp1 = false;
		key_p_wp2 = false;
		key_p_start = false;	
	}
	if (!is_paused(pause_types.door)) {
		if (locked && state != states.grabbed) {
			key_right = false;
			key_p_right = false;
			key_left = false;
			key_p_left = false;
			key_up = false;
			key_p_up = false;
			key_down = false;
			key_p_down = false;	
		}
		else if (local_game_run_step) {
			executed_keys_update = true;
			if (!weapon_demo)
				scr_keys_update();
		}
	}
	if (weapon_demo && state != states.intro) {
		player_weapon_demo();	
	}
	else if (!executed_keys_update) {
		replay_record_update(id);	
	}
	if (pause_enabled)
		player_pause_check();
	if (G.paused && G.pause_type != pause_types.normal)
		player_charge();
	if (!speed_gear) {
		if (global.tile_shader_multiplier < 1) {
			global.tile_shader_multiplier += 0.05;
		} else {
			global.tile_shader_multiplier = 1;	
		}
	}
	if (double_gear_unlocked) {
		if (speed_gear || power_gear) {
			double_gear_icon_i += 0.25;
		} else if (!speed_gear_enabled) {
			double_gear_icon_i += 0.5;	
		} else {
			double_gear_icon_i = 0;	
		}
	}
	if (G.paused && G.pause_type != pause_types.special_attack)
		exit;
	if (!local_game_run_step) {
		animation_ignore_frame++;
		physics_ignore_frame++;
		exit;
	}
	if (under_water && breath_enabled) {
		breath_effect.timer++;
		if (breath_effect.timer > breath_effect.timer_limit) {
			breath_effect.timer = 0;
			player_effect_create(breath_effect);
		}
	} else {
		breath_effect.timer = 0;	
	}
	/*
	var create_item = noone;
	if (keyboard_check(ord("1"))) create_item = obj_pickup_life_1;
	if (keyboard_check(ord("2"))) create_item = obj_pickup_life_2;
	if (keyboard_check(ord("3"))) create_item = obj_pickup_life_3;
	if (keyboard_check(ord("4"))) create_item = obj_pickup_wp_1;
	if (keyboard_check(ord("5"))) create_item = obj_pickup_wp_2;
	if (keyboard_check(ord("6"))) create_item = obj_pickup_wp_3;
	if (keyboard_check(ord("7"))) create_item = obj_pickup_heart;
	if (keyboard_check(ord("8"))) create_item = obj_pickup_lifeup;
	if (create_item != noone) {
		var inst = instance_create_depth(mouse_x, mouse_y, depth - 1, create_item);
		if (create_item == obj_pickup_heart) {
			inst.heart_id = -1;
		}
	}*/
	move = key_right - key_left;
	// Walk to the middle of the screen
	if (walking_to_x) {
		if (state != states.walk)
			state_set(states.walk);
		if (dest_x > x)
			move = 1;
		else if (dest_x < x)
			move = -1;
		if (abs(dest_x - x) < walk_speed) {
			move = 0;
			x = dest_x;
			player_complete_outro();
			walking_to_x = false;
		}
	}
	x_door_check = x;
	y_door_check = y;
	if (glow_mode == 1) {
		glow_alpha = 1;	
	} else {
		glow_alpha = 0;
	}
	if (glow_type == 1) {
		glow_alpha2 = glow_timer / ( glow_length / 2);
		if (glow_timer >= glow_length / 2) {
			glow_alpha2 = 2 - glow_alpha2;
		}
		if (glow_timer >= glow_length) {
			glow_timer = -1;
			glow_type = 0;
		}
		glow_timer++;
	}
	player_check_weapon_change();
	if (state != states.ride) {
		player_gravity();
		script_try(state_array[state]);
		player_saber_check();
		player_immunity();
		player_collision();
		player_door_check();
		special_input_update();
		if (state == states.death) exit;

		for (var i = 0; i < ds_list_size(special_weapons); i++) {
			var spi = special_weapons[| i];
	
			if (!array_contains([states.dolor, states.ready, states.intro, states.complete, states.outro, states.grabbed], state)) {
				script_try(spi.check);
				if (using_special_weapon) {
					shoot_wait = false;
					dash_tap_timers = [0, 0, 0, 0];
					audio_stop(hover_sound);
				}
			}
		}

		player_shoot_check();
		player_saber_check();
		player_check_dolor();
	} else {
		script_try(state_array[state]);
		player_disable_speed_gear();
		player_charge_reset();
		player_charge();	
	}
	full_health = (hp == max_hp);
	player_auto_regen();
}
function player_weapon_demo() {
	var t = floor(weapon_demo_t++);
	key_p_shoot = (t == 60 || t == 180)
	if (t > weapon_demo_limit) {
		weapon_demo_finished = true;
	}
	
}