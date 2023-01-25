event_inherited();
sound = snd_megaman_shot_2;

abs_hspeed = 0;
atk = 2;

// Start
animation_add("S",
[
	0, 0
], 0);
// Loop
animation_add("L", keyframes_generate(3, 1/2,, 1));
// Destroy
animation_add("D", 
[
	0, 4,
	2, 5,
	6, 4,
	9, 4
]);
// Blocked
animation_add("B",
[
	0, 6,
	2, 7,
	4, 6,
	6, 7,
	8, 8,
	10, 9,
	13, 9
]);

animation_play("S");

execute_step_in_first_frame = true;