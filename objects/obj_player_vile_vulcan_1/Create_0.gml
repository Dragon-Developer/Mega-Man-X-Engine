event_inherited();
audio_play(snd_player_x_shot_1);

// Destroy Animation
animation_add("D",
[
	0, 1,
	2, 2,
	4, 3,
	5, 3
]);

// Start
animation_add("S",
[
	0, 0
], 0, 0);

animation_play("S");
abs_hspeed = 6.5;