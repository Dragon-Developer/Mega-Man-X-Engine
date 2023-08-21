function player_state_z_buster_x5() {
	var t = state_timer++;
	
	if (t == 0) {
		animation_play("buster");	
		var inst = player_shoot_projectile(obj_player_zero_shot_x5);
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