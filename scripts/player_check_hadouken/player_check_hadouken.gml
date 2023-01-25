function player_check_hadouken() {
	if (state != states.hadouken
	//&& is_on_floor()
	&& !using_special_weapon
	&& full_health
	&& !instance_exists(hadouken_inst)
	&& special_input_pressed(hadouken_input)) {
		state_set(states.hadouken, 0);
		animation_play("hadouken" + (is_on_floor() ? "": "_air"));
		using_special_weapon = true;
		v_speed = 0;
		if (key_right != key_left) {
			dir = key_right - key_left;
			xscale = dir;
		}
	}


}
