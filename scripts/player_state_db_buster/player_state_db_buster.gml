function player_state_db_buster() {
	var t = state_timer++;
	var _air = "";
	var _n = "_1";

	player_effects_reset();
	shoot_wait = true;
	// 0 = Right Hand, 1 = Left Hand
	if (substates[0] == 1) _n = "_2";

	// Jump
	var can_jump = player_can_jump();
	if (key_p_jump && can_jump) {
		v_speed = -jump_strength;
		_air = "_air";
		if (can_jump == 2) dash_air_count++;
	}
	if (!key_jump && v_speed < 0)
		v_speed = 0;
		
	// Air
	if (!is_on_floor() || v_speed > 0) {
		_air = "_air";
		player_check_move();
	}
	if (t > 1 && substates[0] == 0 && key_p_shoot) {
		substates[1] = 1;
	}
	// End
	if (t > shoot_limit) {
		if (substates[1] == 1) {
			key_p_shoot = true;
		}
		state_set(states.idle, 0, [0, 0]);
		if (!is_on_floor()) {
			if (v_speed < 0) state_set(states.jump, 7, [0, 0]);
			else state_set(states.fall, 8, [0, 0])
		}
	}
	animation = "";
	animation_play("db_buster" + _n + _air, t);

	// Action Scripts
	player_check_wall_slide();
	player_check_wall_jump();

	if (charge_level == 0) {
		player_charge_reset();	
	}
	if (state != states.db_buster) {
		shoot = false;
		shoot_wait = false;
	}

	// Shoot
	if (t == 8 || (t < 8 && state != states.db_buster))
		player_shoot_projectile(shoot_next_projectile, shot_id);



}
