function local_game_speed_init() {
	local_game_speed = global.game_world_speed;
	local_game_t = 0;
	local_game_run_step = true;
	using_world_speed = true;
}
function local_game_speed_update() {
	if (using_world_speed) {
		local_game_speed = global.game_world_speed;	
	}
	if (local_game_speed == 1) {
		local_game_run_step = true;
		exit;
	}
	local_game_t += local_game_speed;
	local_game_run_step = false;
	if (local_game_t >= 1) {
		local_game_t -= 1;
		local_game_run_step = true;
	}
}