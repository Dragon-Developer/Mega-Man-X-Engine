event_inherited();
atk = 5;

shot_level = 1;
hit_if_shot_level_is_equal = true;

animation_add("S",
[
	0, 0,
	2, 1,
	5, 2
], 5);

animation_add("D",
[
	0, 9,
	8, 9
]);
animation_add("B",
[
	0, 6,
	3, 7,
	7, 8,
	8, 8
]);
for (var i = 10; i >= 0; i--) {
	trail_pos[i] = [x, y, false];
}
abs_hspeed = 0;
melee_activated = true;
timer = -1;
wave_timer = 0;
amplitude = 13.5;
angular_vel = 2*pi/18;
initial_phase = 0;
visible = false;
animation_play("S");
execute_step_in_first_frame = true;
x_start = x;
y_start = y;

animation_auto = false;
physics_auto = false;
anti_destroy_limit = 20;