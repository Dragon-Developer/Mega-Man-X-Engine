function player_x_hyper_charge() {
	var lvl = (argument_count > 0) ? argument[0] : -1;
	var t = (argument_count > 1) ? argument[1] : 0;

	charge_level = -1;
	shoot_limit = 16;
	shoot_type = shoot_types.normal;

	switch(lvl) {
		case 0:
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
