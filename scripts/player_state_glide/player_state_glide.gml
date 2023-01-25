function player_state_glide() {
	var t = state_timer++;
	
	if (t == 0) {
		dash_air_count++;
		animation_play("glide");
	}

	grav = 0;
	glide_end = (substates[0] == 1);

	if (!glide_end)
		v_speed = glide_vspeed;

	var condition = false;
	if (!glide_end) {
		if (move != 0) {
			dir = move;
			xscale = dir;
		}
		condition = !move_x(dir * glide_hspeed);
	}
	condition |= is_on_floor() || (shoot_t == 1);
	
	if ((key_p_jump && t) && animation_is_playing("glide")) {
		animation_play("glide_end");
		substates[0] = 1;
	}
	
	if (glide_end && animation_on_end("glide_end"))
		condition = true;
	
	if (condition) {
		substates[0] = 0;
	
		walk_speed = walk_speed_default;
		
		if (!is_on_floor()) {
			grav = gravity_default;
			player_state_set(states.fall, 8);
			animation_play("fall", 8);
		} else {
			player_state_set(states.land, 0);
			animation_play("land");
		}
	}

	player_check_dash();



}
