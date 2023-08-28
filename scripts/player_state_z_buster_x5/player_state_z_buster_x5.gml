function player_state_z_buster_x5() {
	var t = state_timer++;
	
	if (t == 0) {
		animation_play("buster");	
		z_buster_effect_inst = player_effect_create(z_buster_effect);
	}
	if (t == 20) {
		z_buster_effect_inst = player_effect_destroy(z_buster_effect_inst);
		var inst = player_shoot_projectile(z_buster_object);
	}
	if (animation_end) {
		player_check_idle();
		player_check_fall();
		using_special_weapon = false;
		player_weapon_select(weapon_previous);
	}

	player_charge_reset();
	player_saber_reset();

}