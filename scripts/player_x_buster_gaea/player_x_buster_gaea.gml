function player_x_buster_gaea(lvl = -1, t = 0) {

	charge_level = -1;
	shoot_limit = 16;
	shoot_animation = "";
	shoot_type = shoot_types.normal;

	switch(lvl) {
		// Normal shot
		case 0:
			player_shoot_projectile(obj_player_x_shot_gaea_1);
		break;
		// Semi-Charged shot
		case 2:
			player_shoot_projectile(obj_player_x_shot_gaea_2);
			player_super_shoot_animation();
		break;
	}

}
