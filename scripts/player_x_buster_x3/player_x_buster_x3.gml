function player_x_buster_x3() {
	var lvl = (argument_count > 0) ? argument[0] : -1;
	var t = (argument_count > 1) ? argument[1] : 0;

	charge_level = -1;
	shoot_limit = 16;
	shoot_type = shoot_types.normal;

	switch(lvl) {
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
			player_shoot_projectile(obj_player_x_shot_x3_3);
		break;
		// Super-Charged shot
		case 3:
			charge_level = lvl;
			if (t == 0) {
				player_shoot_db_buster(obj_player_x_shot_x3_super, RIGHT);
			} else {
				player_shoot_db_buster(obj_player_x_shot_2, LEFT);	
				player_shoot_sequence_end();
			}
			shot_id++;
			break;
		case 4:
			// Keep this charge level, so the player can shoot at this level again
			charge_level = lvl;
			if (t == 0) {
				player_shoot_db_buster(obj_player_x_shot_x3_super, RIGHT);
			} else if (t == 1) {
				player_shoot_db_buster(obj_player_x_shot_x3_3, LEFT);	
				player_shoot_sequence_end();
			}
			shot_id++;
		break;
	
	}


}
