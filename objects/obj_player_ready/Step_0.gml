if (wait_timer > 0) {
	wait_timer--;
	visible = false;
	exit;
}
// Animation
var t = animation_t;

x = __view_get(e__VW.XView, obj_camera_rds.view_id) + global.view_width / 2;
y = __view_get(e__VW.YView, obj_camera_rds.view_id) + global.view_height / 2;

if (t >= 0 && t <= 25) {
    image_index = t div 2;
	visible = true;
}

if (t >= 35) {
    visible = (((t - 35) mod 8) > 3);
}

if (t == 83) {
	if (instance_exists(obj_player_parent)) {
		obj_player_parent.state = states.intro;	
	}
	instance_destroy();
	exit;
}

animation_t++;