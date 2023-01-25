event_inherited();
atk = 2;
shot_level = 2;
boss_damage[? noone] = 1;
animation_add("L",[0 , 0]);
animation_add("D",
[
	0, 2,
	2, 1,
	3, 0,
	11, 0
]);
animation_add("B",[0 , 0]);
animation_play("L");
owner = noone;
trail_init(3);

shot_rotate = true;
timer = -1;
wave_timer = 0;
amplitude = 12;
angular_vel = 2*pi/16;
execute_step_in_first_frame = true;
initial_phase = 13.62 * pi / 8;

cross = false;
cross_inst = noone;
nearest_enemy = noone;

animation_auto = false;
physics_auto = false;