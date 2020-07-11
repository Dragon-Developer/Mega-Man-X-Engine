var lvl = (argument_count > 0) ? argument[0] : -1;
var t = (argument_count > 1) ? argument[1] : 0;

charge_level = -1;
shoot_limit = 16;

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
		player_shoot_projectile(obj_player_x_shot_x2_3);
	break;
	// Super-Charged shot
	case 3:
	case 4:
		// Keep this charge level, so the player can shoot at this level again
		charge_level = lvl;
		// First Shot
		if (t == 0)
		{
			if (lvl == 3) shoot_next_projectile = obj_player_x_shot_2;
			else shoot_next_projectile = obj_player_x_shot_x2_3;
			
			shoot_cancel_on_wall = true;
			if (wall_slide || wall_jump)
			{
				player_shoot_projectile(shoot_next_projectile);	
			}
			else
			{
				shoot_next_animation = "db_buster_1";
				shoot_next_wait = true;	
				shoot_next_type = shoot_types.special_floor_and_air;
				shoot_at_time = 8;
			}
		}
		// Second Shot
		else if (t == 1)
		{
			shoot_next_projectile = obj_player_x_shot_x2_super;
			shoot_cancel_on_wall = true;
			
			if (wall_slide || wall_jump)
			{
				player_shoot_projectile(shoot_next_projectile);	
			}
			else
			{
				shoot_next_animation = "db_buster_2";
				shoot_next_wait = true;	
				shoot_limit = 27;
				shoot_next_type = shoot_types.special_floor_and_air;
				shoot_at_time = 8;
			}
			if (lvl == 3)
			{
				// Always use this for the last shot
				shot_id = -1;
				charge_level = -1;
			}
		}
		else
		{
			shoot_next_projectile = obj_player_x_saber;
			shoot_at_time = 14;
			shoot_next_animation = "saber";
			shoot_next_type = shoot_types.special_floor_and_air;
			shoot_next_wait = true;	
			shoot_limit = 52;
			// Specifics
			wall_jump_enabled = false;
			wall_jump = false;
			wall_slide = false;
			wall_slide_enabled = false;
			// Always use this for the last shot
			shot_id = -1;
			charge_level = -1;
		}
		shot_id++;
	break;
	
}