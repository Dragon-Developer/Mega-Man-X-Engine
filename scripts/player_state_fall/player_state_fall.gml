function player_state_fall() {
	var t = state_timer++;
	
	if (t < 4 || animation != "fall")
		animation_play("fall", t);

	if (!key_jump && v_speed < 0)
		v_speed = 0;

	if (is_on_floor()) {
		player_state_set(states.land, 1);
		animation_play("land");
		v_speed = 0;
		move_down();
		player_counters_reset();
		walk_speed = walk_speed_default;
		audio_play(land_sound);
	}

	player_check_move();

	// Action Scripts
	player_check_walk();
	player_check_dash();
	player_check_jump();
	player_check_wall_slide();
	player_check_wall_jump();
	player_check_hover();
	player_check_fly();
	player_check_glide();


}
