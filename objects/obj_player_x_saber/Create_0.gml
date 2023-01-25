event_inherited();
animation_end_destroy = true;
anti_destroy = true;
anti_destroy_limit = 13;
animation_add("L", keyframes_generate(13, 1));
animation_play("L");
shot_level = 2;
boss_damage[? noone] = 3; // Default damage on bosses
atk = 16;
weapon_death_type = weapon_death_types.saber;