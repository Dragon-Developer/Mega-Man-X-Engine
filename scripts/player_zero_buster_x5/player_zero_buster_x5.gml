function player_zero_buster_x5(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_limit = 16;
	shoot_type = shoot_types.normal;
	shoot_animation = "";
	shot_id = 0;
	player_charge_reset();	
	if (!is_on_floor()) {
		return;
	}
	v_speed = 0;
	
	switch(lvl)
	{
		// Normal shot
		case 0:
			player_state_set(states.z_buster_x5);
		break;
		// Super-Charged shot
		case 2: 
		case 3:
			player_state_set(states.z_buster_nightmare);
		break;
	}


}
