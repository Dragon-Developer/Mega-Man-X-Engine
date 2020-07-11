event_inherited();
audio_play(snd_player_x_shot_x2_3);

animations_init();

animation_add("start",
[
0, 0,
1, 1,
], 4);

animation_add("loop",
[
0, 2,
2, 3,
4, 4,
5, 4
], 0, 5);

animation_play("start");