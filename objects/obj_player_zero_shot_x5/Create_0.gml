// Inherit the parent event
event_inherited();
animation_add("S", [0, 0], 0, 0);
animation_add("D", [
	0, 5,
	2, 6,
	6, 5,
	9, 5
]);

animation_add("B", [
	0, 7,
	1, 8,
	3, 9,
	5, 10,
	7, 11,
	8, 11
]);
animation_add("L", keyframes_generate(4, 1/2, 0, 1));
animation_add_loop("L");
animation_play("S");
start_frame = 10;
atk = 15;
shot_level = 3;
boss_damage[? noone] = 3;
sound = snd_player_x_shot_x2_3;

abs_hspeed = 0;
abs_hspeed_max = 7.5;

execute_step_in_first_frame = true;