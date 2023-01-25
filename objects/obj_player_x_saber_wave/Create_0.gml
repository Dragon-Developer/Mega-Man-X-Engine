event_inherited();
animation_add("L", keyframes_generate(4, 1 / 2));
animation_add("B",
[
	0, 4,
	1, 5,
	3, 4,
	5, 6,
	7, 7,
	9, 8,
	11, 9
]);
animation_add("D", animations_frames[? "B"]);
animation_add_loop("L");
animation_play("L");
boss_damage[? noone] = 1; // Default damage on bosses
shot_level = 2;
atk = 8; // Damage on enemies
abs_hspeed = 8; // Horizontal Speed
weapon_death_type = weapon_death_types.saber;
collision_script = player_x_saber_wave_collision;