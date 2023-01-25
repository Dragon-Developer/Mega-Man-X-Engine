function player_state_walk() {
	var t = state_timer++;

	if (is_on_floor() && player_check_move()) {
		if (t == 0)
			animation_play("walk");	
	} else {
		if (is_on_floor()) {
			player_state_set(states.idle, 0);
			animation_play("idle");
		} else if (v_speed <= 0) {
			player_state_set(states.fall, 0);
			animation_play("fall");
			v_speed = 0;
		}
	}

	// Action Scripts
	player_check_crouch();
	player_check_dash();
	player_check_jump();
	player_check_dodge_roll();


}
