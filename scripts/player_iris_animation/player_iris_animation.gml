function player_iris_animation() {
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
		5, 1,
		9, 2,
		12, 2
	], 5, 12);

	animation_add("dash_end|dash",
	[
		0, 3
	], 0);


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
		17, 8
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
		17, 7,
	]);

	animation_add("atk_end",
	[
		0, 0,
		3, 1,
		5, 1
	]);

	animation_add("atk_3",
	[
		0, 0,
		1, 1,
		3, 2,
		5, 3,
		7, 4,
		9, 5,
		11, 6,
		14, 6,
		18, 7,
		22, 7
	]);

	animation_add("atk_1_end|atk_end", animations_frames[? "atk_end"]);
	animation_add("atk_2_end|atk_end", animations_frames[? "atk_end"]);
	animation_add("atk_3_end|atk_end", animations_frames[? "atk_end"]);

	animation_add("atk_jump", 
	[
		0, 0,
		1, 1,
		3, 2,
		5, 3,
		7, 4,
		9, 5,
		11, 6,
		13, 6,
		15, 7,
		17, 7
	]);

	animation_add("atk_jump_end|atk_jump",
	[
		0, 8,
		2, 9,
		4, 9
	]);

	animation_add("atk_land", animations_frames[? "atk_jump"]);

	animation_add("atk_land_end|atk_end", animations_frames[? "atk_end"]);


}
