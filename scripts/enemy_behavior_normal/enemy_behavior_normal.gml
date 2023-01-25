// Needs refactoring
function enemy_behavior_normal() {
	PAUSE;
	local_game_speed_update();
	if (local_game_run_step) {
		scr_physics_update(through_walls);
	}
	_p = instance_nearest(x, y, obj_player_parent);
	nearest_player = _p;
	inside_view = is_inside_view();

	if (is_boss) {
		if (boss_buffer > 0) {
			boss_buffer--;
			boss_buffer_t++;
			light += ((boss_buffer_t mod 4) < 2);
		}
		if (boss_buffer == 0) {
			boss_buffer_level = 0;	
			boss_buffer_t = 0;
		}
	}
	if (!is_projectile)
		ene_item();

	if (!persist) {
		ene_out();
	}

	if (G.is_using_door && !is_boss && !door_immunity) {
		if (!v_outside(sprite_width, sprite_height)) {
			instance_destroy();
		}
		else
		exit;
	}
	
	if (local_game_run_step) {
		smoke_update();

		if (frozen) exit;

		if (face_x) {
			if (G.player_x < x)
				xscale = 1;
			else
				xscale = -1;
			dir = -xscale;
		}
		pl_x = G.player_x;
		pl_y = G.player_y;
	}

}
