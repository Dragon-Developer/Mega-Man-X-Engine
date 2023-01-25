function player_state_saber_raikousen() {
	var t = state_timer++;
	var st = state;

	// Attacking
	if (substates[0] == 0) {
		// State Properties
		saber_atk_current = saber_atk;
		grav = 0;
		v_speed = 0;
		// Animation
		if (t <= 30) {
			animation = "";
			if (is_on_floor())
				animation_play(saber_atk_animation, t);
			else 
				animation_play(saber_atk_animation + "_air", t);
		}
		// First Frame
		if (t == 0) {
			voice_play();
			xscale = dir;
			if (!is_on_floor())
				dash_air_count++;
		}
	
		if (t == 12) {
			player_activate_immunity();	
		}
		switch (t) {
			case 12: saber_atk_hspeed = 4; break;
			case 16: saber_atk_hspeed = 7; break;
			case 18: saber_atk_hspeed = 14; break;
			case 24: saber_atk_hspeed = 7; break;
			case 26: saber_atk_hspeed = 3; break;
			case 29: saber_atk_hspeed = 1; break;
		}
		if (t >= 12 && t <= 30) {
			move_x(dir * saber_atk_hspeed);
		}

		var cancel_attack = (state != st || animation_end);

		if (cancel_attack) {
			saber_atk_next = false;
			immunity = false;
			// Action Scripts
			player_check_fall();
			player_check_idle();
			player_check_walk();
			player_check_dash();
			player_check_jump();
		}
	}

	if (state != st) {
		saber_state = noone;
		saber_atk = noone;
		saber_atk_current = noone;	
	}


}
