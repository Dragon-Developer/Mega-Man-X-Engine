function player_check_jump() {
	if (key_p_jump) {
		var can_jump = player_can_jump();
		if (can_jump) {
			if (state == states.dash)
				walk_speed = dash_speed;
			state_set(states.jump, 1, [0]);
			animation_play("jump");
			voice_play();
			v_speed = -jump_strength;
			if (state_unlocked[states.high_jump] && key_up) {
				v_speed = -high_jump_strength;
				grav = 0;
				substates[0] = 1; // High Jump
				dash_air_count++;
			}
		    audio_play(jump_sound);
		}
		
		if (can_jump == 2)
			dash_air_count++;
	}


}
