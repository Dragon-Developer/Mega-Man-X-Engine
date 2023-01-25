function player_megaman_animation() {
	player_animations();
	animation_add("intro", keyframes_generate(18, 1/3,, 1));
	animation_add("outro", keyframes_generate(4, 1/2));
	animation_add("jump",
	[
		0, 0,
		1, 1,
		3, 2,
		7, 3,
		9, 4
	], 9);

	animation_add("fall|jump",
	[
	    0, 4,
	    3, 5
	], 3);
	animation_add("land|jump",
	[
		0, 6,
		2, 7,
		3, 7
	]);

	animation_add("dash|slide",
	[
		0, 0,
		3, 1,
		6, 2,
		8, 2
	], 3, 8);

	animation_add("dash_end|slide",
	[
		0, 0
	], 0);
	
	animation_add("dolor", keyframes_generate(11, 1/3));
	
	animation_add("energy_drain|dolor",
	[
		0, 11,
		8, 0,
		31, 0
	], 0, 31);
	
	animation_add("critical", [
		0, 6,
		6, 5,
		12, 1,
		24, 2,
		36, 1,
		48, 0,
		60, 1,
		72, 2,
		84, 1,
		96, 0,
		102, 5,
		108, 7,
		120, 8,
		132, 7,
		144, 6,
		156, 7,
		168, 8,
		180, 7,
		191, 7
	], 0, 191);
	
	animation_add("complete", [
		0, 0,
		2, 1,
		59, 1
	]);
	animation_add("outro_complete", keyframes_generate(11, 1/2));
	
	animation_add("screen_cleaner", [
		0, 0,
		35, 1,
		37, 2,
		97, 0,
		98, 0
	]);
	
}
