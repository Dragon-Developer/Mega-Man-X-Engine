function player_axl_animations() {
	animation_add("shoot");
	animation_add("hover_shoot");
	animation_add("wall_shoot");

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
		41, 14
	]);

	animation_add("intro_end|intro",
	[
		0, 15,
		10, 16,
		13, 17,
		16, 18,
		20, 18
	]);

	animation_add("complete", 
	[
		0, 0,
		3, 1,
		6, 2,
		9, 3,
		12, 4,
		15, 5,
		18, 6,
		21, 7,
		24, 8,
		71, 8
	]);

	animation_add("outro", keyframes_generate(7, 1/2));
	animation_add("dash",
	[
		0, 0,
		3, 1,
		6, 2,
		9, 3,
		12, 4
	], 12);

	animation_add("dash_end|dash",
	[
		0, 5
	], 0);

	animation_add("dolor",
	[
		0, 0,
		3, 1,
		5, 0,
		7, 1,
		9, 0,
		11, 1,
		13, 0,
		15, 1,
		17, 0,
		21, 1,
		22, 0,
		30, 1,
		32, 0
	]);
	
	animation_add("death|dolor", [
		0, 2
	]);
	
	animation_add("dodge_roll",
	[
		0, 0,
		4, 1,
		9, 2,
		12, 3,
		15, 4,
		18, 5,
		21, 6,
		24, 7,
		27, 8,
		30, 9,
		32, 9
	]);
	
	animation_add("energy_drain|dolor",
	[
		0, 0,
		8, 2,
		31, 2
	], 0, 31);
	animation_add("energy_drain|dolor",
	[
		0, 0,
		8, 2,
		31, 2
	], 0, 31);

	animation_add("hover");
	/*
	animation_add("hover",
	[
		0, 0,
		3, 1,
		6, 2,
		9, 3,
		12, 4,
		14, 4
	], 0, 14);*/


}
