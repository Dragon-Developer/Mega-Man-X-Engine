/// @description Background scroll
var view = view_get_rectangle();
var vx = view[0], vy = view[1], vh = global.view_height;
for (var i = 0, len = array_length(background_object); i < len; i++) {
	var lay_id = layer_id[i], back_obj = background_object[i];
	if (background_far[i] == -1) continue;
	if (instance_exists(back_obj)) {
		with (back_obj) {
			layer_x(lay_id, floor(vx * other.background_far[i] - x));
			var bh = sprite_get_height(global.background_list[| i][| phase].sprite);
			var sh = sprite_height;
			// Find y in the background sprite
			var by = y;
			if (sh > vh)
				by = (vy - y) * (bh - vh) / (sh - vh);
			layer_y(lay_id, vy - by);
		}	
	}
}