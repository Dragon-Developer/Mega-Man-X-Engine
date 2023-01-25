// Inherit the parent event
event_inherited();
animation_add("S", [
	0, 0,
	2, 1,
	4, 2,
	6, 3,
	8, 0,
	97, 0
]);
follow_owner = false;
animation_play("S");
persist = true;
animation_end_destroy = true;
shoot_times = 0;
pos_x = [
	global.view_width*2/5,
	global.view_width*4/5,
	global.view_width*1/5,
	global.view_width*3/5,
];