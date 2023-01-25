function player_state_land() {
	var t = state_timer++;
	
	player_check_move();

	if (t == 0) {
		animation = "";
		animation_play("land");
	}

	if (is_on_floor()) {
		if (animation_end) {
			player_state_set(states.idle, 0);
			animation_play("idle");
		}
	} else {
		player_state_set(states.fall, 0);
		animation_play("fall");
	}

	// Action Scripts
	player_check_crouch();
	player_check_walk();
	player_check_dash();
	player_check_jump();
	player_check_dodge_roll();



}
