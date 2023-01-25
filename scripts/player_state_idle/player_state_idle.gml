function player_state_idle() {
	var t = state_timer++;

	idle_animation = (!critical ? "idle" : "critical");

	if (animation_on_end(idle_animation))
		state_timer = 0;

	if (animation_enabled[state])
		animation_play(idle_animation, t);

	if (move != 0) {
		xscale = move;
		dir = move;
	}
	// Waiting other state
	if (substates[0] == -1) {
		wait_state_t++;
		if (wait_state_t > wait_state_limit) {
			state_set(wait_state, 0, [0]);
		}
	}
	else if (!is_on_floor()) {
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
