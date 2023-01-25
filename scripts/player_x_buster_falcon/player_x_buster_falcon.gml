function player_x_buster_falcon() {
	var lvl = (argument_count > 0) ? argument[0] : -1;
	var t = (argument_count > 1) ? argument[1] : 0;

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
			player_shoot_projectile(obj_player_x_shot_2);
		break;
		// Fully-Charged shot
		case 2:
			player_shoot_projectile(obj_player_x_shot_falcon);
			player_super_shoot_animation();
		break;
	
	}


}
