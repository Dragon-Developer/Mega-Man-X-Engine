function player_fix_pending_projectiles() {
	while (ds_queue_size(projectiles_queue) != 0) {
		var inst = ds_queue_dequeue(projectiles_queue);
		if (!instance_exists(inst)) continue;
		//if (shoot_update_position) {
			if (ds_map_exists(weapon_offset, animation_sprite_name)) {
				var l = weapon_offset[? animation_sprite_name];
				var p = [0, 0];
				var index = animation_i;
				if (ds_list_size(l) == 1)
					index = 0;
				p = l[| index];
				if (array_length_1d(weapon_dir_offsets) > 0 && index < array_length_1d(weapon_dir_offsets)) {
					var arr = weapon_dir_offsets[index];
					p[0] += arr[0];
					p[1] += arr[1];
				}
				inst.x += (p[0] * dir + h_speed);
				inst.x_start = x;
				inst.y += (p[1] * y_dir + v_speed);
				inst.y_start = y;
			}
	//	}
		if (inst.execute_step_in_first_frame) {
			with(inst) {
				event_perform(ev_step, ev_step_normal);	
			}
		}
		if (previous_charge_level > 0) {
			previous_charge_level = 0;	
		}
	}


}
