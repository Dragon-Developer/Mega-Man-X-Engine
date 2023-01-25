event_inherited();
animation_add("L", keyframes_generate(4, 1 / 2), 0, 7);
animation_add("D", [
	0, 4,
	2, 5,
	4, 6,
	8, 7,
	9, 7
]);
animation_add("B", animations_frames[? "D"]);
atk = 2;
dash_enabled = false;
blocked_reflect = false;
auto_destroy = true;
sound = snd_player_x_shot_x4;
animation_play("L");
