event_inherited();
lv = 4;
atk = 2;
boss_damage[? noone] = 2;
anti_destroy = true;
anti_destroy_limit = 3;

sound = snd_player_x_shot_ult;

animations_init();

animation_add("S",
[
	0, 0,
	2, 1,
	4, 2,
	6, 3,
]);

animation_add("L",
[
	0, 4,
	3, 5,
	6, 6,
	9, 7,
	11, 7
], 0, 11);
/*
plasma_balls_count = 0;
plasma_balls_limit = 3;
*/
abs_hspeed = 0;
execute_step_in_first_frame = true;
/*collision_script = player_x_plasma_ball_collision;*/