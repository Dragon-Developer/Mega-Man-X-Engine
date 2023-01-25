/// @description  Initialize
door = false;
ground_mode = true;
_target = obj_player_parent;
_width = global.view_width;
_height = global.view_height;
mid_x = __view_get(e__VW.XView, 0) + _width / 2;
mid_y = __view_get(e__VW.YView, 0) + _height / 2;

instance_create_depth(0, 0, -900, obj_surface);
x = global.player_x;
y = global.player_y;
// properties
global.current_camera = -1;
if (global.reload) {
	global.current_camera = global.prev_camera;
}
global.current_camera_collision = -1;
global.camera_min_x             = 0;
global.camera_min_y             = 0;
global.camera_max_x             = room_width;
global.camera_max_y             = room_height;
phase = 0;
var k = 0, tmp_id = 1;
layer_id = [];
while (tmp_id != -1) {
	tmp_id = layer_get_id("background_" + string(k + 1));
	if (tmp_id != -1) {
		layer_id[k] = tmp_id;	
		background_object[k] = noone;
		background_far[k] = global.background_list[| k][| 0].far;
		k++;
	}
}
// setup view
view_id = instance_number(self) - 1;
slopes_fix();
slope_camera = false;
slope_camera_pos = [];
if (global.checkpoint) exit;
__view_set( e__VW.XView, view_id, median(x-__view_get( e__VW.WView, view_id )*0.5, global.camera_min_x, global.camera_max_x - __view_get( e__VW.WView, view_id ) ));
__view_set( e__VW.YView, view_id, median(y-__view_get( e__VW.HView, view_id )*0.5, global.camera_min_y, global.camera_max_y - __view_get( e__VW.HView, view_id ) ));

if (!instance_exists(_target) || instance_exists(obj_player_ready)) {
	__view_set(e__VW.XView, view_id, global.camera_min_x);
	__view_set(e__VW.YView, view_id, global.camera_min_y);
	x = mid_x;
	y = mid_y;
}
shake_t = 0;