function player_state_z_buster_nightmare() {
	var t = state_timer++;
	
	if (t == 0) {
		animation_play("buster_charge");	
		z_buster_count = 0;
	}
	if (t mod z_buster_interval == 0 && z_buster_count < z_buster_limit) {
		var inst = player_shoot_projectile(z_buster_object);
		z_buster_function(inst, z_buster_count);
		z_buster_count++;
		if (z_buster_count >= z_buster_limit) {
			animation_play("buster");	
		}
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