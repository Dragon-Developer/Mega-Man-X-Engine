event_inherited();

abs_hspeed = 0;
anti_destroy = true;
anti_destroy_limit = 0;
boss_damage[? obj_magma_dragoon] = 2;
lv = 4;
atk = 0.5; //because it's the hadouken
animation_add("L",
[
	0, 28,
	2, 29,
	4, 30,
	6, 31,
	7, 31
], 0, 7);
animation_auto = false;
sound = snd_player_x_shot_storm_tornado;