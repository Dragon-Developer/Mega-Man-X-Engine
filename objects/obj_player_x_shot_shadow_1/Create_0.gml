event_inherited();
sound = snd_player_x_shot_1;

atk = 2;
//abs_hspeed = 4;
abs_speed = 4;
dir_angle = 0;

animations_init();

animation_add("loop",
[
	0, 0,
	4, 1,
	8, 2,
	11, 2
], 0, 11);

animation_play("loop");