event_inherited();
lv = 4;
atk = 2;
boss_damage[? noone] = 3;
anti_destroy = true;
anti_destroy_limit = 1;
abs_hspeed = 0;
abs_hspeed_max = 6;
abs_vspeed_max = 1.5;
destroy_reset_speed = false;
sound = snd_player_x_shot_x2_3;
v_speed_dir = 0;
animation_add("L", [
	0, 0,
	2, 1,
	5, 2,
	8, 3,
	9, 4,
	10, 5,
	12, 6,
	14, 7,
	16, 8,
	17, 8
], 12, 17);
animation_play("L");
execute_step_in_first_frame = true;