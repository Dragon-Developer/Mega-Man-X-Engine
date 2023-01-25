event_inherited();

animation_add("S",
[
	0, 0,
	1, 1,
], 4);

/*
animation_add("L",
[
	0, 2,
	2, 3,
	4, 4,
	5, 4
], 0, 5);
*/
animation_add("L", keyframes_generate(3, 1/3,, 2));
animation_add_loop("L");