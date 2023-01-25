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
	if (shot_type == 2) {
		var angles = [-89, -30, 30, 89];
		for (var i = 0; i < 4; i++) {
			shot = instance_create_depth(x, y, depth, object_index);
			shot.dir = dir;
			shot.image_xscale = dir;
			shot.is_main = false;
			shot.shot_angle = angles[i];
			shot.shot_type = 1;
			ds_list_add(shots_group, shot);
			with (shot) {
				event_perform(ev_step, ev_step_normal);	
			}	
			player_shot_sync_groups();
		}
	}
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
	accel_type = 1;
	if (t > homing_limit_max)
		target = noone;
	if (target != noone) {
		auto_rotate = false;
		var t_angle = point_direction(x, y, target.x, target.y);
		var dd = angle_difference(t_angle, dir_angle);
		var d = distance_to_object(target);
		if (d < 48 || abs(dd) < 75) {
			if (abs(dd) > 8) {
				dir_angle += dd / 4;
				abs_speed = max(0, abs_speed - abs(dd) / 180);
			}
		} else {
			accel_type = 0;
			h_speed += lengthdir_x(acceleration, t_angle);
			v_speed += lengthdir_y(acceleration, t_angle);
			dir_angle = point_direction(x, y, x + h_speed, y + v_speed);
			abs_speed = min(abs_speed_max, sqrt(max(0, h_speed * h_speed + v_speed * v_speed)));
		}

	}
	if (auto_rotate && t > homing_limit_min) {
		var dd = angle_difference(dir_angle, (dir == 1) ? 0 : 180);
		if (abs(dd) > 30) {
			dir_angle -= 2*sign(dd);	
		}
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
	particle_xstart = - lengthdir_x(3, angle);
	particle_ystart = - lengthdir_y(2, angle) - 1;
	particle_xstart *= dir;
	image_index = animation_i;
}