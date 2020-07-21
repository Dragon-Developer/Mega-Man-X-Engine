player_animations();

animation_add("hover");
animation_add("super_shoot",
[
	0, 0,
	2, 1,
	4, 2,
	12, 3,
	23, 4,
	33, 5,
	36, 6
], 36);

animation_add("super_shoot_c",
[
	0, 0,
	4, 1,
	12, 2,
	23, 3,
	33, 4,
	36, 5
], 36);

animation_add("shoryuken",
[
	0, 0,
	2, 1,
	4, 2,
	6, 3,
	9, 4,
	11, 4
], 6, 11);
	
animation_add("shoryuken_fall|shoryuken",
[
	0, 5,
	2, 6,
	3, 6
], 3);
	
animation_add("shoryuken_end|shoryuken",
[
	0, 8,
	5, 8
]);
	
animation_add("hadouken", 
[
	0, 0,
	6, 1,
	17, 2
], 17);

animation_add("nova_strike",
[
	0, 0,
	2, 1,
	4, 2,
	8, 3,
	11, 4,
	12, 5,
	13, 6,
	14, 7,
	15, 8
], 12, 15);