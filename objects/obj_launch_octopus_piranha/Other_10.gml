var t = timer++;
if (t == 0) {
	h_speed = dir * abs_speed;
	if (dir == -1)
		dir_angle = 180;
}
// Let's find the target
if ((target == noone || !instance_exists(target) || target.hp <= 0) && (t > homing_limit_min && t < homing_limit_max)) {
	target = noone;
	var n = instance_number(obj_player_parent);
	var nearest_dist = 4*global.view_width;
	for (var i = 0; i < n; i++) {
		var e = instance_find(obj_player_parent, i);
		var d = distance_to_object(e);
		if (e.hp > 0 && d < nearest_dist) {
			target = e;
			nearest_dist = d;
		}
	}
}
accel_type = 1;
if (t > homing_limit_max)
	target = noone;
if (target != noone) {
	auto_rotate = false;
	var t_angle = point_direction(x, y, target.x, target.y);
	var dd = angle_difference(t_angle, dir_angle);
	var d = distance_to_object(target);
	/*if (d < 48 || abs(dd) < 75) {
		if (abs(dd) > 8) {
			dir_angle += dd / 4;
			abs_speed = max(0, abs_speed - abs(dd) / 180);
		}
	} else {*/
		accel_type = 0;
		h_speed += lengthdir_x(acceleration, t_angle);
		v_speed += lengthdir_y(acceleration, t_angle);
		dir_angle = point_direction(x, y, x + h_speed, y + v_speed);
		abs_speed = min(abs_speed_max, sqrt(max(0, h_speed * h_speed + v_speed * v_speed)));
	//}

}
if (auto_rotate && t > homing_limit_min) {
	var dd = angle_difference(dir_angle, (dir == 1) ? 0 : 180);
	if (abs(dd) > 30) {
		dir_angle -= 2*sign(dd);	
	}
}
if ((t > 20 && is_inside_view()) || t > homing_limit_max) {
	persist = false;
}
if (t == homing_limit_min && shot_type == 2) {
	acceleration *= 2;	
}
if (accel_type == 1)
	abs_speed = min(abs_speed_max, abs_speed + acceleration);
h_speed = lengthdir_x(abs_speed, dir_angle);
v_speed = lengthdir_y(abs_speed, dir_angle);
// Animation
var angle = point_direction(x, y, x + h_speed, y + v_speed);
animation_i = round((angle / 360) * 16);
if (dir == -1)
	animation_i = 8 - animation_i + image_number;
image_index = animation_i;