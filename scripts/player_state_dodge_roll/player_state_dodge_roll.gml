function player_state_dodge_roll() {
	var t = state_timer++;

	animation_play("dodge_roll", t);
	
	shoot_wait = true;
	move_x(dir * dodge_roll_speed);

	var condition = (t >= dodge_roll_limit || !is_on_floor());

	if (condition) {
		player_check_idle();
		player_check_fall();
		if (move != 0) {
			dir = move;
			xscale = move;
		}
		if (key_down){
			state_set(states.crouch, 8);
			animation_play("crouch", 8);
		}
		shoot_wait = false;
	}



}
