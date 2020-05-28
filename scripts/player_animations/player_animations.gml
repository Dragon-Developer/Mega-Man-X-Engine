animation_add("idle", 
[
	0, 0,
	80, 1,
	84, 2,
	92, 1,
	96, 0,
	144, 1,
	148, 2,
	152, 1,
	156, 0,
	160, 1,
	164, 2,
	168, 1
], 0, 171);

animation_add("walk", 
[
	0, 0,
	5, 1,
	6, 2,
	8, 3,
	11, 4,
	14, 5,
	17, 6,
	19, 7,
	21, 8,
	24, 9,
	27, 10,
	30, 1
], 5, 30);

animation_add("jump",
[
	0, 0,
	3, 1,
	7, 2
], 7);

animation_add("fall|jump",
[
    0, 2,
    3, 3,
    7, 4
], 7);

animation_add("land|jump",
[
	0, 5,
	2, 6,
	3, 6
]);

animation_add("dash",
[
	0, 0,
	3, 1,
], 3);

animation_add("dash_end|dash",
[
	0, 0
], 0);

animation_add("wall_slide|wall",
[
	0, 0,
	3, 1,
	6, 2
], 6);

animation_add("wall_jump|wall",
[
	0, 3,
	3, 4
], 3);