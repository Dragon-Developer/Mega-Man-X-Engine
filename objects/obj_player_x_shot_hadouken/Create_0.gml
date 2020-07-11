event_inherited();

abs_hspeed = 4;

animations_init();

animation_add("loop", 
[
	0, 0,
	2, 2,
	3, 1,
	5, 0,
	7, 2,
	8, 2
], 3, 8);

animation_play("loop");