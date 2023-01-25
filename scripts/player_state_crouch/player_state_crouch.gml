function player_state_crouch() {
	var t = state_timer++;
	if (t == 0) {
		for (var i = 0; i < 4; i++) {	
			dash_tap_timers[i] = 0;
		}
	}

	if (key_down) {
		animation_play("crouch", t);
		if (move != 0) {
			dir = move;
			xscale = dir;
		}
	} else {
		if (animation == "crouch")
			animation_play("crouch_end", t);
			
		if (animation_end && is_on_floor()) {
			player_state_set(states.idle, 0);
			animation_play("idle", 0);
		}

		player_check_walk();
	}

	if (!is_on_floor()) {
		player_state_set(states.fall, 0);
		animation_play("fall");
	}
	player_check_dash();
	player_check_jump();
	player_check_dodge_roll();


}
