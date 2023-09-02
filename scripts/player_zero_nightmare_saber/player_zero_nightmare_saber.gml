function player_zero_nightmare_saber(lvl = -1, t = 0) {
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
		case 1:
			player_saber_use(saber_atks.charged_saber, obj_player_zero_nightmare_wave);
		break;
		// Super-Charged shot
		case 2: 
		case 3:
//			player_state_set(states.charged_saber_big);
		break;
	}


}
