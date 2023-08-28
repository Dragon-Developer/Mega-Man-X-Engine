function player_zero_animations() {
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

	animation_add("complete|outro",
	[
		0, 0,
		2, 1,
		4, 2,
		6, 3,
		8, 4,
		11, 5,
		17, 6,
		64, 6
	]);
	animation_add("outro",
	[
		0, 7,
		2, 8,
		4, 9,
		6, 10,
		7, 10
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
	
	animation_add("energy_drain|dolor2",
	[
		0, 1,
		8, 0,
		31, 0
	], 0, 31);
	
	animation_add("death|dolor2", [0, 0]);
	// Saber Attacks
	animation_add("atk_1",
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

	animation_add("atk_1_end|atk_1",
	[
		0, 10,
		6, 11,
		10, 12,
		12, 13,
		16, 14,
		21, 14
	]);

	animation_add("atk_2",
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

	animation_add("atk_2_end|atk_2",
	[
		0, 10,
		6, 11,
		10, 12,
		12, 13,
		16, 14,
		21, 14
	]);

	animation_add("atk_3",
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

	animation_add("atk_3_end|atk_3",
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
		12, 6,
		14, 7,
		15, 7
	]);

	animation_add("atk_jump_end|atk_jump",
	[
		0, 8,
		1, 8
	]);

	animation_add("atk_land",
	[
		0, 0,
		1, 1,
		2, 2,
		4, 3,
		6, 4,
		8, 5,
		12, 6,
		14, 7,
		15, 7
	]);

	animation_add("atk_land_end|atk_land",
	[
		0, 8,
		1, 8
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

	// Special
	animation_add("atk_mikazukizan",
	[
		0, 0,
		1, 1,
		3, 2,
		4, 3,
		6, 4,
		8, 5,
		10, 6,
		13, 7,
		15, 8,
		16, 8
	]);

	animation_add("atk_ryuenjin",
	[
		0, 0,
		1, 1,
		2, 2,
		3, 3,

		4, 4,
		6, 5,
		8, 6,
		10, 7,
		12, 8,
		14, 9,
		16, 10,
		18, 11,
		20, 12,
		22, 13,
		24, 14,
		26, 15,
		27, 15
	], 4, 27);

	animation_add("atk_ryuenjin_end|atk_ryuenjin",
	[
		0, 16,
		3, 17,
		4, 17
	]);

	animation_add("atk_hyouretsuzan",
	[
		0, 0,
		2, 1,
		4, 2,
		7, 3,
		9, 3,
	], 4, 9);

	animation_add("atk_hyouretsuzan_end|atk_hyouretsuzan",
	[
		0, 4,
		2, 5,
		4, 6,
		7, 7,
		10, 8,
		14, 9,
	]);

	animation_add("atk_shippuuga",
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
		10, 9
	]);

	animation_add("atk_shippuuga_end|atk_shippuuga",
	[
		0, 10,
		2, 11,
		5, 12,
		9, 13,
		14, 14,
		17, 14
	]);

	animation_add("atk_raikousen",
	[
		0, 0,
		1, 1,
		2, 2,
		3, 3,
		4, 4,
		5, 5,
		6, 6,
		7, 7,
		8, 8,
		10, 9,
		12, 10,
		15, 11,
		18, 12,
	
		24, 13,
		25, 14,
		26, 15,
		27, 16,
		28, 17,
		29, 18,
		30, 19,
		31, 20,
		32, 21,
		33, 22,
		34, 23,
		35, 24,
		36, 25,
		37, 26,
		38, 27
	]);

	animation_add("atk_raikousen_air", animations_frames[? "atk_raikousen"]);

	animation_add("messenko",
	[
		0, 0,
		4, 1,
		10, 2,
		18, 3,
		20, 4,
		22, 5,
		23, 6,
		25, 7,
		27, 8,
		30, 9,
		32, 10,
		33, 11,
		35, 13,
		39, 14,
		43, 13,
		47, 14,
		51, 13,
		55, 14,
		59, 13,
		63, 15,
		67, 16,
		71, 17,
		75, 18,
		77, 18
	]);
	
	animation_add("shin_messenko", animations_frames[? "messenko"]);

	animation_add("buster", [
		0, 0,
		20, 1,
		25, 2,
		30, 3,
		35, 4,
		40, 5,
		44, 5
	]);
}
