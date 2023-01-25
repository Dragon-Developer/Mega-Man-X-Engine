event_inherited();

if (timer == 0 && !destroy) {
	physics_ignore_frame = 1;
	instance_create_depth(x, y, depth + 1, obj_player_axl_ray_muzzle);
	can_hit = true;
}

if (shot_direction_index == 2 || shot_direction_index == 4) {
	h_speed = sign(h_speed) * 4;
	v_speed = sign(v_speed) * 4;
}

inst_list = [ds_list_create(), ds_list_create()];
if (!destroy) {
	with (object_index) {
		if (id != other.id && !destroy && shot_direction_index == other.shot_direction_index && dir == other.dir) {
			if (sign(x - other.x) == sign(other.h_speed) && sign(y - other.y) == sign(other.v_speed)) {
				ds_list_add(other.inst_list[1], id);	
			} else {
				ds_list_add(other.inst_list[0], id);
			}
		}
	}}
// For colinear checks
var my_y0 = 0;
if (h_speed != 0)
	my_y0 = y - v_speed * x / h_speed;
for (var k = 0; k < 2; k++) {
	var list = inst_list[k], lsize = ds_list_size(list);
	draw_fin[k] = !destroy;
	for (var i = 0; i < lsize; i++) {
		var inst = list[| i];
		if (point_distance(x + (k ? h_speed : 0), y + (k ? v_speed : 0), inst.x, inst.y) <= ray_length) {
			// Colinear Condition
			var is_col = false;
			if (h_speed == 0 && floor(inst.x) == floor(x))
				is_col = true;
			else if (inst.h_speed != 0) {
				var y0 = inst.y - inst.v_speed * inst.x / inst.h_speed;
				if (floor(y0) == floor(my_y0))
					is_col = true;
			}
			if (is_col) {
				draw_fin[k] = false;
				i = lsize;
			}
		}
	}
	ds_list_destroy(list);
}