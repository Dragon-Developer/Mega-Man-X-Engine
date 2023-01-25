event_inherited();
atk = 4;
destroy_if_equal_to_atk = true;
abs_speed_max = 4;
abs_speed = 4;
acceleration = 0;
target = noone;
h_accel = 0;
v_accel = 0;
dir_angle = 0;

player_shot_set_particles(obj_player_x_shot_smoke, 4, 2);
particle_variable_ystart = 0;
particle_hspeed = 0;
particle_h_accel = 0;
particle_xstart = 0;
particle_ystart = 0;
particle_depth = -1;

sound = missileshot;
animation_add("D",
[
	0, 1,
	2, 2,
	4, 3,
	5, 3
]);
is_main = true;
shot_type = 1;
homing_limit_min = 5;
homing_limit_max = 60*5;
animation_auto = false;