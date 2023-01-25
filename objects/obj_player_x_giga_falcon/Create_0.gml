event_inherited();
lv = 4;
atk = 2;
boss_damage[? noone] = 6;
anti_destroy = true;
anti_destroy_limit = 3;

animations_init();

animation_add("L",
[
	0, 0,
	3, 1,
	6, 2,
	9, 3,
	11, 3
], 0, 11);

animation_play("L");
/*
plasma_balls_count = 0;
plasma_balls_limit = 3;
*/
abs_vspeed = 4;
execute_step_in_first_frame = false;
/*collision_script = player_x_plasma_ball_collision;*/