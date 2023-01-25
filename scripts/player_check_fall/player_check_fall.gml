function player_check_fall() {
	if (!is_on_floor()) {
		animation_play("fall", 8);
		player_state_set(states.fall, 8);
	}


}
