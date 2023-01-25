function player_megaman_buster(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_limit = 16;
	shoot_type = shoot_types.normal;
	shoot_animation = "";

	switch(lvl)	{
		// Normal shot
		case 0:
			player_shoot_projectile(obj_player_megaman_shot_1);
		break;
		// Semi-Charged shot
		case 1:
			player_shoot_projectile(obj_player_megaman_shot_2);
		break;
		// Fully-Charged shot
		case 2:
			player_shoot_projectile(obj_player_megaman_shot_3);
		break;
	}


}
