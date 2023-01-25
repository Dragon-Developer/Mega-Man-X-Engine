function player_state_saber_down() {
	var t = state_timer++;
	var st = state;

	// Attacking
	if (substates[0] == 0) {
		// State Properties
		saber_atk_current = saber_atk;
	
		// First Frame
		if (t == 0) {
			animation = "";
			if (v_speed < 0) v_speed = 0;
		}
		if (t < 1)
			animation_play(saber_atk_animation, t);
	
		// Action Scripts
		player_check_dash();
		player_check_jump();
		player_check_wall_slide();
		player_check_wall_jump();
	
		if ((animation_end && state == st) || is_on_floor())
			substates[0] = 1; // End

		var cancel_attack = (state != st);

		if (cancel_attack || substates[0] == 1) {
			state_timer = 0;
			if (!cancel_attack) {
				animation_play(saber_atk_animation + "_end");
				audio_play(saber_atk_sound);
			}
			saber_atk_next = false;
		}
	} else {
		saber_atk_current = noone;
		if (animation_end || animation != saber_atk_animation + "_end") {
			player_check_fall();
			player_check_idle();
		}
		// Action Scripts
		player_check_walk();
		player_check_dash();
		player_check_jump();
	}
	// Air
	if (!is_on_floor())
		player_check_move();

	if (state != st) {
		saber_state = noone;
		saber_atk = noone;
		saber_atk_current = noone;	
	}


}
