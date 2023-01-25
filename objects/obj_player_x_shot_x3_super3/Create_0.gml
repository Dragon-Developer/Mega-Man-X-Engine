event_inherited();
atk = 3;
shot_level = 2;
boss_damage[? noone] = 1;
hit_if_shot_level_is_equal = true;
destroy_if_equal_to_atk = true;
animation_add("L", 
[
	0, 3,
	15, 2,
	30, 2
], 0, 30);
/*animation_add("D",
[
	0, 2,
	2, 1,
	3, 0,
	11, 0
]);*/

animation_add("D",
[
	0, 4,
	2, 5,
	4, 6,
	5, 6
]);

animation_add("B", animations_frames[? "D"]);
animation_play("L");
owner = noone;
trail_init(3);

shot_rotate = true;
timer = -1;
execute_step_in_first_frame = true;

cross = false;
cross_inst = noone;

nearest_enemy = noone;
h_speed = -2;
distance_x = 160;
distance_y = 0;
timer = 0;
time_to_impact = 26;
h_accel = 0.25;
v_accel = 0.25;
h_max = 45;

physics_auto = false;