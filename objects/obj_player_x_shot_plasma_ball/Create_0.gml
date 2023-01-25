event_inherited();
lv = 4;
shot_level = 0;
shot_level_increase_frames = 30;
atk = 1;
anti_destroy = true;
anti_destroy_limit = 4;

//audio_play(snd_player_x_shot_ult);

animations_init();
/* Old
animation_add("L",
[
   0, 0,
   1, 1,
   2, 2,
   3, 1
], 0, 3);
*/
animation_add("L",
[
   0, 0,
   2, 1,
   4, 2,
   6, 3,
   7, 3
], 0, 7);

animation_add("E",
[
   0, 3,
   2, 4,
   5, 5 
]);

animation_play("L");
abs_hspeed = 0;