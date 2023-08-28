event_inherited();
lv = 4;
atk = 2;
can_hit = false;
shot_counted = false;
destroy_reset_speed = false;

animation_add("S", [
	0, 0,
	3, 1,
	4, 2,
	5, 3,
	6, 4,
	7, 4
]);
animation_play("S");
execute_step_in_first_frame = true;
animation_end_destroy = true;
global.camera_shake += 1;