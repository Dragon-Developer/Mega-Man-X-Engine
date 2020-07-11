animation_add("intro", 
[
	0, 1,
	3, 2,
	6, 3,
	9, 4,
	12, 5,
	15, 6,
	18, 7,
	21, 8,
	24, 9,
	27, 10,
	30, 11,
	33, 12,
	36, 13,
	39, 14,
	42, 15,
	44, 15
]);

animation_add("intro_end|intro",
[
	0, 16,
	10, 17,
	13, 18,
	16, 19,
	20, 19
]);

animation_add("fall|jump",
[
    0, 3
], 0);

animation_add("land|jump",
[
	0, 4,
	2, 5,
	3, 5
]);

animation_add("dash",
[
	0, 0,
	3, 1,
	6, 2,
	9, 3,
	12, 4
], 12);

animation_add("hover",
[
	0, 0,
	3, 1,
	6, 2,
	9, 3,
	12, 4,
	14, 4
], 0, 14);