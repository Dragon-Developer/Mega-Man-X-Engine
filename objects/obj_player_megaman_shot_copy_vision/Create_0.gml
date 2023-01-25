event_inherited();
atk = 2;
can_hit = false;
shoot_times = 28;
sound = snd_megaman_shot_copy_vision;
boss_damage[? noone] = 0; // Default damage on bosses
// Start
animation_add("S", [
	0, 0,
	1, 1,
	3, 2,
	5, 3,
	7, 4,
	9, 5,
	11, 6,
	12, 6,
	13, 7,
	20, 7
]);
animation_add("L", keyframes_generate(6, 6/10, false, 7), 0, 9);
animation_add("D", keyframes_generate(7, 1/2, true));
animation_play("S");
execute_step_in_first_frame = true;
state = 0;