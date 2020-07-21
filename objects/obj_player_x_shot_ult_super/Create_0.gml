event_inherited();

audio_play(snd_player_x_shot_ult);

animations_init();

animation_add("init",
[
	0, 0,
	2, 1,
	4, 2,
	6, 3,
]);

animation_add("loop",
[
	0, 4,
	3, 5,
	6, 6,
	9, 7,
	11, 7
], 0, 11);

abs_hspeed = 0;
execute_step_in_first_frame = true;