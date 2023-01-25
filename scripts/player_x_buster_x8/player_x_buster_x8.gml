function player_x_buster_x8(lvl = -1, t) {
	charge_level = -1;
	shoot_limit = 16;
	shoot_animation = "";
	shoot_type = shoot_types.normal;

	switch(lvl)
	{
		// Normal shot
		case 0:
			player_shoot_projectile(obj_player_x_shot_1);
		break;
		// Semi-Charged shot
		case 1:
			player_shoot_projectile(obj_player_zero_shot_x1_2);
		break;
		// Fully-Charged shot
		case 2:
			player_shoot_projectile(obj_player_x_shot_x2_3);
		break;
		// Super-Charged shot
		case 3:
			player_shoot_projectile(obj_player_x_shot_x8_ult);
			player_super_shoot_animation();
		break;
	
	}


}
