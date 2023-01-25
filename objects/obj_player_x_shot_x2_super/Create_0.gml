event_inherited();
atk = 4;
shot_level = 2;
hit_if_shot_level_is_equal = true;
sound = snd_player_x_shot_x2_super;

animations_init();
animation_add("L",
[
	0, 0,
	2, 1,
	3, 0,
	5, 2
], 0, 5);

animation_add("B",
[
	0, 3,
	1, 4,
	3, 5,
	5, 6,
	7, 7,
	8, 7
]);

shots = [];
abs_hspeed = 1;

animation_play("L");
execute_step_in_first_frame = true;