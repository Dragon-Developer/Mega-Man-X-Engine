animation_init();
animations_init();
scr_physics_init(0, 0, 0);
animation_add("S",
[
	0, 0,
	9, 1,
	19, 2,
	29, 3
]);
dir = 1;
animation_play("S");