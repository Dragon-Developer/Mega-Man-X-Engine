event_inherited();
sound = snd_megaman_shot_3;

abs_hspeed = 0;
abs_hspeed_max = 8;
atk = 4;
boss_damage[? noone] = 2; // Default damage on bosses
// Start
animation_add("S",
[
	0, 0
], 0);
// Loop
animation_add("L", keyframes_generate(4, 1/2,, 1));
// Destroy
animation_add("D", 
[
	0, 5,
	2, 6,
	6, 5,
	9,5
]);
// Blocked
animation_add("B",
[
	0, 7,
	2, 8,
	4, 7,
	6, 8,
	8, 9,
	10, 10,
	13, 10
]);

animation_play("S");

execute_step_in_first_frame = true;