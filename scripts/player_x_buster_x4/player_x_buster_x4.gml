var lvl = (argument_count > 0) ? argument[0] : -1;
var t = (argument_count > 1) ? argument[1] : 0;

charge_level = -1;
shoot_limit = 16;
shoot_animation = "";

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
		player_shoot_projectile(obj_player_x_shot_ult_super);
		
		if (idle)
		{
			shoot_next_animation = "super_shoot";
			shoot_next_type = shoot_types.super_shot;
			shoot_next_projectile = noone;
			shoot_limit = 41;
		}
	break;
	
}