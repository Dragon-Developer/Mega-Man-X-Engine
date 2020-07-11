event_inherited();
audio_play(snd_player_x_shot_2);

abs_hspeed = 0;

animations_init();

animation_add("start",
[
	0, 0,
	2, 1,
	4, 2,
	6, 3
], 6);

animation_add("loop", 
[
	0, 4,
	1, 5,
	2, 6,
	3, 6,
	4, 5,
	5, 4
], 0, 5);

animation_play("start");