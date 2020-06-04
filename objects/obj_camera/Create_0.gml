_target = obj_player_parent;
_width = global.view_width;
_height = global.view_height;

view_camera[0] = camera_create();
camera_set_view_size(view_camera[0], _width, _height);
alarm[0] = 1; // Window Center
var _x = -1, _y = -1;
while(x != _x || y != _y)
{
	_x = x;
	_y = y;
	camera_follow_player();
}
gpu_set_texfilter(false);