function player_door_check() {
	if (state == states.outro) exit;
	var door_inst = doors_get_first_collision([
		{ x:  1, y:  0 },
		{ x: -1, y:  0 },
		{ x:  0, y:  1 },
		{ x:  0, y: -1 },
		{ x: sign(x - x_door_check), y : 0 }
	]);
	if (door_inst != noone && door_inst.state == door_states.none) {
		var d = door_inst.dir;
		var used_door = noone;
		if (!door_inst.is_vertical) {
			if (sign(x - x_door_check) == d || sign(h_speed) == d || move == d) {
				if ((d == 1 && x < door_inst.x) || (d == -1 && x > door_inst.x)) {
					if (ceil(bbox_top) >= door_inst.bbox_top && bbox_bottom <= door_inst.bbox_bottom) {
						used_door = door_inst;
					}
					if (used_door != noone && bbox_top <= door_inst.bbox_top) {
						y = ceil(y);
						if (bbox_top <= door_inst.bbox_top) {
							move_y(1);	
						}
					}
				}
			}
		} else if (sign(y - y_door_check) == d || sign(v_speed) == d || place_meeting(x, y - 1, door_inst) || place_meeting(x, y + 1, door_inst)){
			if ((d == 1 && y < door_inst.y) || (d == -1 && y > door_inst.y)) {
				if (bbox_left >= door_inst.bbox_left && bbox_right <= door_inst.bbox_right) {
					used_door = door_inst;
				}
			}
		}
		if (used_door != noone) {
			with (used_door) {
				target = other;
				state_set(door_states.open);
			}
			h_speed = 0;
			v_speed = 0;
			physics_ignore_frame = 1;
			if (used_door.is_vertical && used_door.dir == 1)
				animation_play("fall", 8);
			audio_stop(land_sound);
		}
	}
}
function doors_get_first_collision(positions) {
	var inst = noone;
	for (var i = 0, len = array_length(positions); i < len; i++) {
		inst = instance_place(x + positions[i].x, y + positions[i].y, obj_door_parent);
		if (inst != noone) break;
	}
	return inst;
}