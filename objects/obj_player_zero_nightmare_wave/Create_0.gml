event_inherited();
shot_level = saber_atks.charged_saber + 1;
atk = 4;
boss_damage[? noone] = 1;
shot_counted = true;
destroy_reset_speed = false;
abs_speed = 5;
weapon_death_type = weapon_death_types.saber;
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