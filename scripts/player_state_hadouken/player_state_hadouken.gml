function player_state_hadouken() {
	var t = state_timer++;

	if (t < hadouken_limit) {
		animation_play("hadouken" + (is_on_floor() ? "": "_air"), t);	
	}

	grav = 0;
	v_speed = 0;
	if (t == 18) {
		hadouken_inst = player_shoot_projectile(obj_player_x_shot_hadouken);
		voice_play();
	}

	if (t >= hadouken_limit) {
		player_check_idle();
		player_check_fall();
		if (!is_on_floor())
			grav = gravity_default;
		using_special_weapon = false;
	}

	player_charge_reset();


}
