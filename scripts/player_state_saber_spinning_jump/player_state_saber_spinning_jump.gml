function player_state_saber_spinning_jump() {
	var t = state_timer++;
	var st = state;

	// Attacking
	if (substates[0] == 0) {
		// State Properties
		saber_atk_current = saber_atk;
	
		// First Frame
		if (t == 0) {
			animation = "";
			audio_play(saber_atk_sound);
		}
		if (t < 10)
			animation_play(saber_atk_animation, t);
		// Do next attack after the animation is done
		if (t > 14 && saber_key_p && !is_on_floor())
			saber_atk_next = true;

		var do_next_combo = false;

		if (saber_atk_next && t >= 8 && (saber_atk != noone))
			do_next_combo = true;
	
		if (!key_jump && v_speed < 0)
			v_speed = 0;
	
		// Action Scripts
		player_check_dash();
		player_check_jump();
		player_check_wall_slide();
		player_check_wall_jump();
	
		if (animation_end && state == st)
			substates[0] = 1; // End

		var cancel_attack = (state != st || is_on_floor());

		if (cancel_attack || animation_end || do_next_combo) {
			state_timer = 0;
			if (do_next_combo && !cancel_attack && !is_on_floor()) {
				substates[0] = 0;
			} else {
				saber_atk = noone;
				player_check_fall();
				player_check_idle();
			}
			saber_atk_next = false;
		}
	}

	// Air
	if (!is_on_floor())
		player_check_move();

	if (state != st)
		saber_state = noone;


}
