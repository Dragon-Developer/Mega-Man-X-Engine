event_inherited();
sound = snd_player_x_shot_2;

abs_hspeed = 0;
atk = 2;

// Start
animation_add("S",
[
	0, 0,
	2, 1,
	4, 2,
	6, 3
], 6);
// Loop
animation_add("L", 
[
	0, 4,
	1, 5,
	2, 6,
	3, 6,
	4, 5,
	5, 4
], 0, 5);
// Destroy
animation_add("D", 
[
	0, 7,
	2, 8,
	6, 7,
	9, 7
]);
// Blocked
animation_add("B",
[
	0, 9,
	2, 10,
	4, 9,
	6, 11,
	8, 12,
	10, 13,
	13, 13
]);

animation_play("S");

execute_step_in_first_frame = true;