function player_state_saber_up() {
	var t = state_timer++;
	var st = state;

	// Attacking
	if (substates[0] == 0) {
		// State Properties
		saber_atk_current = saber_atk;
		ceil_reset_vspeed = false;
		// First Frame
		if (t == 0) {
			animation = "";
			audio_play(saber_atk_sound);
		}
		if (t <= 3) {
			grav = 0;
			v_speed = 0;
		}
		// Jump
		if (t >= 4 && t <= 11)
			v_speed = -jump_strength;	
		// Play Animation
		if (t < 10)
			animation_play(saber_atk_animation, t);
		// Move horizontally
		if (t >= 4 && t <= 24)	
			move_x(dir);
		if (!saber_key2_h)
			v_speed = 0;
		if (t > 30 && v_speed >= 0 || !saber_key2_h)
			substates[0] = 1;
		// Cancel Attack Conditions
		var cancel_attack = (state != st || animation_end || substates[0] == 1);

		if (cancel_attack) {
			state_timer = 0;
			saber_atk = noone;
			animation_play(saber_atk_animation + "_end");
			player_check_idle();
			saber_atk_next = false;
		}
	} else {
		if (animation_end || animation != saber_atk_animation + "_end") {
			player_check_fall();
			player_check_idle();
		}
		// Action Scripts
		player_check_crouch();
		player_check_walk();
		player_check_dash();
		player_check_jump();
	}
	if (state != st) {
		saber_state = noone;
		saber_atk = noone;
		saber_atk_current = noone;
		ceil_reset_vspeed = true;
	}


}
