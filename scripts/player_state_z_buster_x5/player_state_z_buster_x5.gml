function player_state_z_buster_x5() {
	
	var t = state_timer++;
	
	if (t == 0) {
		animation_play("buster_charge");	
		z_buster_effect_inst = player_effect_create(z_buster_effect);
	}

	if (t == z_buster_charge_interval) {
		animation_play("buster");	
		z_buster_effect_inst = player_effect_destroy(z_buster_effect_inst);
		var inst = player_shoot_projectile(z_buster_object);
	}

	player_check_dash();
	player_check_jump();
	
	if (animation_end) {
		player_check_idle();
		player_check_fall();
	}

	player_charge_reset();
	player_saber_reset();

}