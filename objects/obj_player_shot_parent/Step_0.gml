PAUSE;
if (instance_exists(owner)) {
	local_game_speed = owner.local_game_speed;	
}
local_game_speed_update();
if (local_game_run_step) {
	event_user(1);
	if (animation_auto) {
		animation_update(true);
	}
	if (physics_auto) {
		scr_physics_update();
	}
	if (shot_level_increase_frames > 0) {
		shot_level_increase_t++;
		if (shot_level_increase_t >= shot_level_increase_frames) {
			shot_level++;
			shot_level_increase_t = 0;
		}
	}
}
if (animation_end_destroy && animation_end) {
	instance_destroy();
	exit;
}
