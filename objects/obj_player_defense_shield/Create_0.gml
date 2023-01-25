event_inherited();

animation_add("S",
[
	0, 0,
	1, 1,
	3, 2,
	5, 3,
	7, 4,
	8, 5,
	11, 6,
	14, 7,
	17, 8,
	19, 8
], 8, 19);

animation_play("S");

timer_limit = 306;