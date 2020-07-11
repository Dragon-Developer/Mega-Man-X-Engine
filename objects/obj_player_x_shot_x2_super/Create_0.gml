event_inherited();

audio_play(snd_player_x_shot_x2_super);

animations_init();
animation_add("loop",
[
	0, 0,
	2, 1,
	3, 0,
	5, 2
], 0, 5);

shots = [];
abs_hspeed = 1;

animation_play("loop");
execute_step_in_first_frame = true;