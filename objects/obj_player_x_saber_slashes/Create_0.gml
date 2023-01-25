event_inherited();
animation_add("S", keyframes_generate(image_number, 1 / 2));
animation_play("S");
animation_end_destroy = true;
boss_damage[? noone] = 1; // Default damage on bosses
shot_level = 2;
atk = 2; // Damage on enemies
anti_destroy = true;
anti_destroy_limit = 14;
weapon_death_type = weapon_death_types.saber;
shot_level_increase_frames = 13;