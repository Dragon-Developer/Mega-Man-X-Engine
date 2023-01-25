PAUSE;
local_game_speed_update();
event_user(1);
if (local_game_run_step) {
	scr_physics_update(false);
	animation_update(true);
}
if (v_speed > 0 && is_on_floor())
	v_speed = 0;