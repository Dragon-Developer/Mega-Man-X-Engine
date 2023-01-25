event_inherited();
animation_add("S", [0, 0]);
animation_add("L", [
	0, 1,
	2, 2,
	4, 3,
	6, 2,
	7, 2
], 0, 7);
animation_play("S");
amount = 8;
pickup_pause = true;
pickup_type = pickup_types.hp;