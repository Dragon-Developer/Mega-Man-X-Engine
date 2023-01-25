function player_x_plasma_ball_collision() {
	var ene = argument[0];
	if (plasma_balls_count >= plasma_balls_limit) exit;
	var _x = (x + 3*instance_center_get_x(ene)) / 4;
	var _y = (y + 3*instance_center_get_y(ene)) / 4;
	instance_create_depth(_x, _y, depth - 1, obj_player_x_shot_plasma_ball);
	plasma_balls_count++;


}
