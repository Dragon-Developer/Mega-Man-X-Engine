/// @description Step
event_inherited();
var t = timer++;
if (t == 0) {
	if (is_main)
		audio_play(sound);
	h_speed = dir * abs_speed;
	if (dir == -1)
		dir_angle = 180;
	dir_angle += shot_angle*dir;
}
if (destroy) {
	sprite_index = spr_x_shot_1;
	h_speed = 0;
	v_speed = 0;
	abs_speed = 0;
	animation_auto = true;
} else {
	// Let's find the target
	if ((target == noone || !instance_exists(target) || target.hp <= 0 || !target.damageable) && (t > homing_limit_min && t < homing_limit_max)) {
		target = noone;
		var n = instance_number(par_enemy);
		var nearest_dist = 2*global.view_width;
		for (var i = 0; i < n; i++) {
			var e = instance_find(par_enemy, i);
			var d = distance_to_object(e);
			if (!e.is_projectile && e.hp > 0 && d < nearest_dist && e.inside_view && e.damageable) {
				target = e;
				nearest_dist = d;
			}
		}
	}
	if (t > homing_limit_max)
		target = noone;
	if (target != noone) {
		var t_angle = point_direction(x, y, target.x, target.y);
		var dd = angle_difference(dir_angle, t_angle);
		if (abs(dd) > 5) {
			dir_angle -= 5*sign(dd);	
		}
	}
	var tmp_angle = round(dir_angle / 15) * 15;
	h_speed = lengthdir_x(abs_speed, tmp_angle);
	v_speed = lengthdir_y(abs_speed, tmp_angle);
	// Animation
	var angle = point_direction(x, y, x + h_speed, y + v_speed);
	animation_i = round((angle / 360) * 16);
	if (dir == -1)
		animation_i = 8 - animation_i + image_number;
	particle_xstart = - lengthdir_x(3, angle);
	particle_ystart = - lengthdir_y(2, angle) - 1;
	particle_xstart *= dir;
	image_index = animation_i;
}