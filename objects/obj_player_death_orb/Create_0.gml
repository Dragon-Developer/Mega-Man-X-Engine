event_inherited();

palette_init();
palette_texture_set(plt_x_full);

animation_add("S",
[
	0, 0,
	8, 1,
	16, 2,
	22, 2,
	24, 3,
	25, 3
], 22, 25);

speed_direction = 0;

animation_play("S");