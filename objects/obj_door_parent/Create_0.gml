event_inherited();
animation_init();
animations_init();
state_machine_init();
surface_draw_init();
animation_add("S", [
	0, 0
], 0);
animation_add("N", [
	0, 10
], 0);
// Open
animation_add("O", [
	0, 3,
	4, 1,
	6, 2,
	10, 1,
	12, 4,
	16, 5,
	20, 6,
	24, 3,
	28, 4,
	30, 5,
	34, 6,
	36, 1,
	38, 2,
	42, 1,
	44, 7,
	48, 8,
	51, 8
]);
// Close
animation_add("C", [
	0, 9,
	15, 8,
	19, 7,
	23, 1,
	25, 2,
	29, 1,
	31, 3,
	47, 4,
	51, 5,
	55, 6,
	59, 3,
	63, 4,
	67, 5,
	71, 6,
	75, 1,
	77, 2,
	81, 0
]);
trail_init(0);
open_limit = 170;
close_limit = 0;
target = noone;
moving_target = false;
dir = image_yscale;
camera_id = -1;
boss_door = false;
is_vertical = (abs(sprite_width) > abs(sprite_height));