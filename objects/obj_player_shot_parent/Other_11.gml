/// @description Step

for (var i = 0; i < ds_list_size(shots_group); i++) {
	var inst = shots_group[| i];
	if (inst != self && !instance_exists(inst)) {
		ds_list_delete(shots_group, i--);
	}
}
if (!sound_played) {
	sound_index = audio_play(sound);
	sound_played = true;
}
if (!destroy && particle_object != noone) {
	var t = particle_t++;
	if ((t >= particle_time_start) && (t mod particle_time_course == 0)) {
		var _y = y;
		if (particle_variable_ystart) {
			particle_ystart -= 6;
			if (particle_ystart < -12) {
				particle_ystart = 12;	
			}
		}
		_y += particle_ystart;
		var particle = instance_create_depth(x + particle_xstart*dir, _y, depth + particle_depth, particle_object);
		particle.dir = dir;
		particle.image_xscale = dir;
		particle.h_speed = particle_hspeed*dir;
		particle.h_acceleration = -particle_h_accel*dir;
	}
}
if (auto_destroy && !destroy && timer >= auto_destroy_limit) {
	destroy = true;	
}
if (destroy) {
	var t = destroy_t++;
	if (destroy_reset_speed) {
		h_speed = 0;
		v_speed = 0;
	}
	// Play Destroy Animation
	if (t == 0) {
		if (!anti_destroy) {
			animation = "";
			h_speed = 0;
			v_speed = 0;
			if (blocked)
				animation_play("B", -1);	
			else
				animation_play("D", -1);		
		}
		else {
			physics_ignore_frame = 1;
			animation_ignore_frame = 1;
		}
	}
	if (anti_destroy && t >= anti_destroy_limit) {
		destroy_t = 0;
		destroy = false;
		exit;
	}
	if (animation_end && !anti_destroy) {
		instance_destroy();
		exit;
	}
}
if (!is_inside_view() && target == noone) {
	instance_destroy();
	exit;
}
if (can_hit)
	scr_weapon_collision();