function player_shoot_db_buster() {
	if (state == states.dolor) exit;
	shoot_next_projectile = argument[0];
	var d = argument[1];
	if (array_contains([states.wall_jump, states.wall_slide, states.hover], state)) {
		player_shoot_projectile(shoot_next_projectile);
		if (state == states.hover)
			shoot_wait = true;
	} else {
		if (d == RIGHT) {
			player_state_set(states.db_buster, 0, [0]);
			ds_queue_enqueue(projectiles_queue, noone);
		} else {
			shoot_limit = 27;
			player_state_set(states.db_buster, 0, [1]);
			ds_queue_enqueue(projectiles_queue, noone);
		}
	}



}
