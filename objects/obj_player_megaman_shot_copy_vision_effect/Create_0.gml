// Inherit the parent event
event_inherited();
animation_add("S", [
	0, 0,
	1, 1,
	3, 2,
	5, 3,
	7, 4,
	9, 5,
	10, 5
]);
follow_owner = false;
animation_play("S");
