PAUSE;
with (obj_player_parent) {
	if (!dead && state != states.teleport_dash)
		move_x(2 * other.dir * other.local_game_speed);	
}
if (instance_exists(owner)) {
	if (owner.desperate)
		timer_limit = 240;
}
local_game_speed_update();
if (local_game_run_step) {
	animation_update(true);
	timer++;
	if (timer >= timer_limit) {
		instance_destroy();
	}
}