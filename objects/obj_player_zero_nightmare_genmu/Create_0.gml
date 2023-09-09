event_inherited();
shot_level = saber_atks.genmu + 1;
atk = 2;
can_hit = false;
boss_damage[? noone] = 2;
anti_destroy = true;
anti_destroy_limit = 0;
shot_counted = true;
destroy_reset_speed = false;
abs_speed = 6;
weapon_death_type = weapon_death_types.saber;
sound = snd_player_zero_saber_2;
animation_add("L", [
	0, 0,
	1, 1,
	2, 2,
	3, 3,
	4, 2,
	5, 1
], 0, 5);
animation_play("L");
execute_step_in_first_frame = true;