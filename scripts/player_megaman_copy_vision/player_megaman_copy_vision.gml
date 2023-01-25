function player_megaman_copy_vision(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_limit = 16;
	shoot_type = shoot_types.normal;
	shoot_animation = "";
	var shot_exists = false;
	with (obj_player_megaman_shot_copy_vision) {
		if (owner == other.id) {
			shot_exists = true;	
		}
	}
	if (!shot_exists) {
		player_shoot_projectile(obj_player_megaman_shot_copy_vision);	
	} else {
		var inst = player_shoot_projectile(obj_player_megaman_shot_1);	
		inst.ignore_cost = true;
	}
}
