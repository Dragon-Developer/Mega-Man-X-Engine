PAUSE_EXCEPT;
if (!is_inside_view() || destroy)
{
//	if (instance_exists(owner)) owner.shots_count--;
	instance_destroy();
}
local_game_speed_update();
if (!local_game_run_step) {
	physics_ignore_frame++;
}
else {
	if (melee_activated)
		scr_weapon_collision();
	event_user(1);
	animation_update(true);
}