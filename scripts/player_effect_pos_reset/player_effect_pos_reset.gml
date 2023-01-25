function player_effect_pos_reset() {
	var _x = 0, _y = 0;

	if (argument[0] == noone || !instance_exists(argument[0])) exit;

	_x = argument[0].xoffset;
	_y = argument[0].yoffset;

	argument[0].x = floor(x) + _x * dir;
	argument[0].y = floor(y) + _y * y_dir;



}
