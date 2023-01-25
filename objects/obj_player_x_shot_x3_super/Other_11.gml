/// @description Step
event_inherited();
var t = timer++;
if (destroy)
{
	var t = destroy_t - 1;
	if (t >= 3)
		visible = false;
	if ((!cross && t >= 4) || t >= 10) {
		instance_destroy();
		exit;
	}
	if (t == 9 && instance_exists(cross_inst)) {
		shot_counted = 2;
		charged_shot = 2;
		// Middle shot
		var shot = instance_create_depth(cross_inst.x, cross_inst.y, cross_inst.depth - 1, obj_player_x_shot_x3_super2);
		shot.dir = dir;
		shot.timer = 4;
		shot.image_xscale = dir;
		ds_list_add(shots_group, shot);
		with (shot) {
			event_perform(ev_step, ev_step_normal);	
		}
		// Find nearest enemy
		nearest_enemy = noone;
		with (par_enemy) {
			if (is_inside_view() && !is_projectile) {
				if ((x > other.x && other.dir == 1) || (x < other.x && other.dir == -1)) {
					if (other.nearest_enemy == noone || abs(y - other.y) < abs(other.nearest_enemy.y - other.y))
						other.nearest_enemy = self;
				}
			}
		}
		if (!instance_exists(nearest_enemy)) {
			shot.abs_hspeed_max = 5;
		}
		// Create other shots
		for (var i = 0; i < 4; i++) {
		    shot = instance_create_depth(cross_inst.x, cross_inst.y, cross_inst.depth - 2, obj_player_x_shot_x3_super3);
		    shot.dir = dir;
			shot.image_xscale = dir;
			// Extreme shots
			if (i == 0 || i == 3) {
		        shot.h_max *= 1.5;
		        shot.h_speed *= 1.5;
				shot.sprite_index = spr_x_shot_x3_super_green;
				shot.time_to_impact += 5;
		    } else {
				shot.sprite_index = spr_x_shot_x3_super_orange;	
			}
			shot.nearest_enemy = nearest_enemy;
		    shot.distance_x *= dir;
			with (shot) {
				if (nearest_enemy != noone) {
			        distance_x = nearest_enemy.x - x;
			        distance_y = nearest_enemy.y - y;
				}
		        if (distance_x < 0)
		            h_speed *= -1;
				// Initial vertical speed for this height
				v_speed = sqrt(2 * abs(v_accel * h_max));
		    }
			// Set vertical speed and acceleration direction
		    if (i <= 1)
		        shot.v_speed *= -1;
		    else 
		        shot.v_accel *= -1;
			// Get correct acceleration to collide with the target
		    with (shot) {
		        h_accel = 2 * (distance_x / time_to_impact - h_speed) / time_to_impact;
		        v_accel = 2 * (distance_y / time_to_impact - v_speed) / time_to_impact;
				if (!instance_exists(nearest_enemy)) {
					v_accel = 0;
					v_speed = sign(v_speed); 
					h_accel = 0.4*dir;
				}
		    }
			if (!instance_exists(nearest_enemy) && (i == 0 || i == 3)) {
				shot.h_accel *= 1.9;	
				shot.v_speed *= 2;
				shot.h_speed *= 2;
			}
			with (shot) {
				event_perform(ev_step, ev_step_normal);	
			}
			ds_list_add(shots_group, shot);
		}
		// Sync all projectiles created from this shot
		player_shot_sync_groups();
		shot_counted = 0;
		cross_inst.shot_counted = 0;
	}
}
else
{
	// Set Green Position and Create Others
	if (t == 0 && is_main) {
		audio_play(snd_player_x_shot_x2_3);
		x_start = x;
		y_start = y;
		x += 2;
		y += 7;
		for (var i = 0; i < 2; i++) {
			var shot = instance_create_depth(x_start, y_start, depth, object_index);
			shot.dir = dir;
			// White
			if (i == 0) {
				shot.x += 6;
				shot.y -= 6;
				shot.sprite_index = spr_x_shot_x3_super_white;
				shot.initial_phase = 5.62*pi/8;
			} else { // Orange
				shot.x += 10;
				shot.sprite_index = spr_x_shot_x3_super_orange;
				shot.initial_phase = 9.62*pi/8;
			}
			if (shot.execute_step_in_first_frame) {
				with (shot) {
					event_perform(ev_step, ev_step_normal);
				}
			}
			ds_list_add(shots_group, shot);		
		}
		
		player_shot_sync_groups();
	}
	if (t == 0) {
		trail_init(3);
		h_acceleration = 0.033*dir;
		//h_speed = 0*dir;
	}
	if (t > 0) {
		var angle = angular_vel*(wave_timer) + initial_phase;
		v_speed = -amplitude*angular_vel*cos(angle);
		h_acceleration += 0.005*dir;
		wave_timer++;
	}
	// Cross check
	with (obj_player_x_shot_x3_3) {
		// Check if it has the same owner as this super shot projectile
		if (owner == other.owner && owner.dir == other.dir) {
			if (place_meeting(x + h_speed, y, other) || place_meeting(x - 2*h_speed, y, other) || place_meeting(x - 4*h_speed, y, other)) {
				other.cross = true;
				can_hit = false;
				animation_play("C");
				h_speed = 0;
				destroy = true;
				destroy_t = 1;
				other.cross_inst = self;
			}
		}
	}
	if (cross && !destroy && cross_inst != noone && ds_exists(shots_group, ds_type_list)) {
		for (var i = 0; i < ds_list_size(shots_group); i++) {
			var shot = shots_group[| i];
			if (instance_exists(shot)) {
				shot.destroy = true;
			}
		}
	}
	abs_hspeed = abs(h_speed);
	if (abs_hspeed >= 5.5) {
		abs_hspeed = 5.5;
		h_acceleration = 0;
	}
	h_speed = abs_hspeed * dir;
	
}
scr_physics_update();

if (destroy && destroy_t == 1) exit;

for (var i = 2; i > 0; i--)
{
	trail_pos[i] = trail_pos[i - 1];
}

trail_pos[0] = [x, y];