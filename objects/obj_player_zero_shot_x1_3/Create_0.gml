event_inherited();
atk = 15;
shot_level = 3;
boss_damage[? noone] = 3;
hit_if_shot_level_is_equal = true;
sound = snd_player_x_shot_x2_3;

animation_add("S", [
	0, 0,
	1, 1,
	2, 2
]);
animation_add("L", [
	0, 3,
	2, 4,
	3, 3,
	5, 5
], 0, 5);

animation_add("D", [
	0, 6,
	2, 7,
	6, 6,
	9, 6
]);

animation_add("B", [
	0, 8,
	1, 9,
	3, 10,
	5, 11,
	7, 12,
	8, 12
]);

abs_hspeed = 0;
abs_hspeed_max = 7.5;

animation_play("L");
execute_step_in_first_frame = true;