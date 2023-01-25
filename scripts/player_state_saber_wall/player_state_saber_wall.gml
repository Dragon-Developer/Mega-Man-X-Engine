function player_state_saber_wall() {
	var t = state_timer++;
	var st = state;

	grav = 0;
	v_speed = wall_slide_vspeed;
	script_try(wall_slide_dust.script);
	
	// Attacking
	if (substates[0] == 0) {
		// State Properties
		saber_atk_current = saber_atk;
	
		// First Frame
		if (t == 0) {
			animation = "";
			audio_play(saber_atk_sound);
		}
	
		if (t < 9)
			animation_play(saber_atk_animation, t);
		// Do next attack after the animation is done
		if (t > 4 && saber_key_p && !is_on_floor() && !can_move_x(-dir))
			saber_atk_next = true;

		var do_next_combo = false;

		if (saber_atk_next && t >= 8 &&
		(saber_atk != noone))
			do_next_combo = true;
	
		// Action Scripts
		player_check_wall_jump();

		if (animation_end && state == st)
			substates[0] = 1; // End

		var cancel_attack = (state != st || is_on_floor() || can_move_x(-dir) || (move != 0 && dir != -move));

		if (cancel_attack || animation_end || do_next_combo) {
			state_timer = 0;
			if (do_next_combo && !cancel_attack && !is_on_floor()) {
				substates[0] = 0;
			} else {
				if (!cancel_attack) {
					saber_end_animation = saber_atk_animation + "_end";
					animation_play(saber_end_animation);
				}
				substates[0] = 1;
				saber_atk = noone;
			}
			saber_atk_next = false;
		}
	}
	// End
	else {
		if (is_on_floor() || animation_end || animation != saber_atk_animation + "_end") {
			if (!can_move_x(-dir)) {
				player_state_set(states.wall_slide, 8);
				animation_play("wall_slide", 8);
			} else {
				player_check_fall();
				player_check_idle();
			}
		}
		// Action Scripts
		player_check_crouch();
		player_check_walk();
		player_check_dash();
		player_check_jump();	
	}
	if (state != st)
		saber_state = noone;


}
