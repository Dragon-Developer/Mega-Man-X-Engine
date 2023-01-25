event_inherited();
atk = 4;
boss_damage[? noone] = 3;
shot_level = 2;
hit_if_shot_level_is_equal = true;
// Cross Animation
sound = noone;
animation_add("L", keyframes_generate(4, 0.5));
animation_add_loop("L");
animation_add("B",
[
	0, 4,
	2, 5,
	4, 6,
	6, 7,
	8, 8,
	11, 8
]);
animation_add("D", animations_frames[? "B"]);
player_shot_set_particles(obj_player_shot_particles, 4, 5);
particle_hspeed = 0;