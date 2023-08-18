event_inherited();
lv = 4;
atk = 4;
shot_level = 1;
boss_damage[? noone] = 2;
anti_destroy = true;
destroy_reset_speed = false;
anti_destroy_limit = 10;

sound = snd_player_x_shot_ult;

animations_init();

animation_add("S",
[
	0, 0,
	2, 1,
	4, 2,
	6, 3,
]);

animation_add("L",
[
	0, 4,
	3, 5,
	6, 6,
	9, 7,
	11, 7
], 0, 11);

plasma_balls_count = 0;
plasma_balls_limit = 3;
abs_hspeed = 0;
execute_step_in_first_frame = true;
on_collision = function(ene) {
	if (plasma_balls_count >= plasma_balls_limit) exit;
	var _x = (x + 3*instance_center_get_x(ene)) / 4;
	var _y = (y + 3*instance_center_get_y(ene)) / 4;
	instance_create_depth(_x, _y, depth - 1, obj_player_x_shot_plasma_ball);
	plasma_balls_count++;	
}