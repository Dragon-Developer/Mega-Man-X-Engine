event_inherited();

animation_add("S", [
	0, 0,
	1, 6,
	2, 1,
	3, 6,
	4, 2,
	5, 6,
	6, 2,
	7, 6,
	8, 3,
	9, 6,
	10, 0,
	11, 6
], 0, 11);

animation_add("D", [
	0, 4,
	1, 6,
	2, 5,
	3, 6
], 2, 3);

animation_play("S");

draw_on_surface = true;
pause_exceptions = [pause_types.special_attack];