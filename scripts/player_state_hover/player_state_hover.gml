function player_state_hover() {
	var t = state_timer++;

	if (t == 0) {
		animation_play("hover");
		audio_play(hover_sound, true);
		if (hover_keep_dir) {
			animation_i = 2;
			hover_neutral = true;
		} else {
			dash_air_count++;
		}
		player_effects_reset();
	}
	
	if (hover_keep_dir) {
		var result = dir*(key_right - key_left);
		var desired_frame = 2 * (result + 1);
		var dif = desired_frame - animation_i;
		animation_i += sign(dif) * 0.25;
		if (move != 0) {
			move_x(move * hover_speed);
			if (hover_neutral) {
				dash_air_count++;
				hover_neutral = false;
				state_timer = 1;
				t = 0;
			}
		}
	} else {
		player_check_move();	
	}
	
	if (hover_vertical) {
		var tt = hover_vertical_t++;
		
		if (tt > hover_vertical_limit) {
			hover_vertical_dir *= -1;
			hover_vertical_t = 0;
		}
		var sp = (hover_vertical_speed * hover_vertical_dir);
		if (is_place_free(x, y + sp))
			y += sp;
	}
	var current_length = hover_length[0];
	if (!hover_neutral)
		current_length = hover_length[1];

	if (t >= 0 && t <= current_length) {
		grav = 0;
		v_speed = 0;
		walk_speed = hover_speed;
	}
	
	if (hover_effect[0] != noone) 
		player_effect_layer(hover_effect_layer, hover_effect[0], hover_effect_speed, hover_effect_limit, animation_i);
	
	var result = key_right - key_left;
	var condition = false;
	
	condition |= (result != 0 && !can_move_x(result * walk_speed));

	if (t > current_length) {
		grav = gravity_default / 2;
		condition |= (hover_mode == 0);
	}
	// If it's not a toogle mode and the player isn't pressing the jump key anymore, cancel hover
	condition |= ((!key_jump && !hover_toggle_mode) && t);
	// Cancel hover if the player is on floor
	condition |= is_on_floor();
	// If it's a toggle mode and the player pressed the jump key again (t > 0), cancel hover
	condition |= (key_p_jump && hover_toggle_mode) && t;
	
	if (condition) {
		player_check_idle();
		player_check_fall();
		walk_speed = walk_speed_default;
		
		if (!is_on_floor()) {
			grav = gravity_default;
			if (hover_keep_dir && hover_neutral)
				dash_air_count++;
		} else {
			move_down();	
		}
	}

	// Action Scripts
	player_check_walk();
	player_check_dash();
	player_check_jump();
	player_check_wall_slide();
	player_check_wall_jump();

	// Changed State
	if (state != states.hover) {
		audio_stop_sound(hover_sound);
		player_effects_reset();
	}


}
