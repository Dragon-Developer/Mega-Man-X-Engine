event_inherited();
atk = 1;
owner = obj_player_zero;

melee_activated = false;
// Sounds
block_sound = snd_melee_block;
hit_sound = snd_melee_hit;

weapon_type = weapon_types.saber;
weapon_death_type = weapon_death_types.saber;
destroy = false;

palette_init();
palette_texture_set(plt_saber);

enum saber_color {
	green,
	purple,
	blue,
	purple2,
	black
}