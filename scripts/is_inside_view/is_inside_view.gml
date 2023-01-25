function is_inside_view() {
	var rect = [];
	rect[0] = x - sprite_xoffset;//*dir;
	rect[1] = y - sprite_yoffset;
	rect[2] = rect[0] + sprite_width;//*dir;
	rect[3] = rect[1] + sprite_height;
	var v = [];
	if (argument_count == 0) {
		var vx = 0, vy = 0, vw = global.view_width, vh = global.view_height;
		if (instance_exists(obj_camera_rds)) {
			var view_id = obj_camera_rds.view_id;
			vx = __view_get(e__VW.XView, view_id);
			vy = __view_get(e__VW.YView, view_id);
			vw = __view_get(e__VW.WView, view_id);
			vh = __view_get(e__VW.HView, view_id);
		}
		v = [vx, vy, vx + vw, vy + vh];
		if (rect[0] > rect[2]) {
			var tmp = rect[0];
			rect[0] = rect[2];
			rect[2] = tmp;
		}
		if (rect[1] > rect[3]) {
			var tmp = rect[1];
			rect[1] = rect[3];
			rect[3] = tmp;
		}
	} else {
		v = argument[0];	
	}
	return rectangle_in_rectangle(rect[0], rect[1], rect[2], rect[3], v[0], v[1], v[2], v[3]);
	//return (bbox_right > vx && bbox_left < vx + vw && bbox_bottom > vy && bbox_top < vy + vh);
}
