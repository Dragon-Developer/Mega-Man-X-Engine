animation_add("intro",
[
	0, 1,
	2, 2,
	4, 3,
	6, 4,
	8, 5,
	10, 6,
	12, 7,
	14, 8,
	16, 9,
	18, 10,
	21, 11,
	33, 12,
	37, 13,
	39, 13
]);

animation_add("jump",
[
	0, 0,
	3, 1,
	7, 2,
	10, 3,
	12, 3
], 7, 12);

animation_add("fall|jump",
[
    0, 3,
    3, 4,
    7, 5,
	10, 6,
	12, 6
], 7, 12);

animation_add("land|jump",
[
	0, 7,
	2, 8,
	3, 8
]);

animation_add("dash",
[
	0, 0,
	1, 1,
	3, 2,
	5, 3,
	7, 4,
	9, 5,
	11, 6,
	12, 6
], 5, 12);

// Saber Attacks
animation_add("atk1",
[
	0, 0,
	1, 1,
	2, 2,
	3, 3,
	4, 4,
	5, 5,
	6, 6,
	9, 7,
	11, 8,
	14, 9,
	17, 9
]);

animation_add("atk1_end|atk1",
[
	0, 10,
	6, 11,
	10, 12,
	12, 13,
	16, 14,
	21, 14
]);

animation_add("atk2",
[
	0, 0,
	2, 1,
	3, 2,
	5, 3,
	7, 4,
	8, 5,
	9, 6,
	13, 7,
	14, 8,
	17, 9,
	19, 9
]);

animation_add("atk2_end|atk2",
[
	0, 10,
	6, 11,
	10, 12,
	12, 13,
	16, 14,
	21, 14
]);

animation_add("atk3",
[
	0, 0,
	1, 1,
	2, 2,
	3, 3,
	4, 4,
	6, 5,
	7, 6,
	8, 7,
	9, 8,
	11, 9,
	12, 10,
	16, 11,
	19, 11
]);

animation_add("atk3_end|atk3",
[
	0, 12,
	6, 13,
	10, 14,
	12, 15,
	16, 16,
	22, 17,
	24, 17
]);

animation_add("atk_jump",
[
	0, 0,
	1, 1,
	2, 2,
	4, 3,
	6, 4,
	8, 5,
	11, 5
]);

animation_add("atk_jump_end|atk_jump",
[
	0, 6,
	2, 7,
	4, 8
]);

animation_add("atk_land",
[
	0, 0,
	1, 1,
	2, 2,
	4, 3,
	6, 4,
	8, 5,
	11, 5
]);

animation_add("atk_land_end|atk_land",
[
	0, 6,
	2, 7,
	4, 8
]);

animation_add("atk_wall",
[
	0, 0,
	1, 1,
	3, 2,
	5, 3,
	7, 4,
	9, 5,
	10, 6
]);

animation_add("atk_wall_end|atk_wall",
[
	0, 7,
	3, 8,
	6, 9,
	8, 10,
	12, 10
]);