// This would not be necessary if we had a better collision system for slopes
function slopes_fix() {
	// Move Slopes X axis
	with (obj_slope_parent) {
		var px = 8, h = 16;
		if (image_xscale > 0) {
			x += px;
		}
		if (image_xscale < 0) {
			x -= px;	
		}
	}
	// Fix Horizontal Blocks near to the slopes
	with (obj_slope_parent) {
		var px = 8, h = 16;
		var inst = instance_place(x, y, obj_square_16);
		if (instance_exists(inst)) {
			if (inst.y == y) {
				if (image_xscale > 0 && x < inst.x) {
					inst.x += px;
					inst.image_xscale -= px / h;
				} else if (image_xscale < 0 && x > inst.x) {
					//inst.x -= px;	
					inst.image_xscale -= px / h;
				}
			}
		}
	}
	// Fix Vertical Blocks below the slopes
	with (obj_slope_parent) {
		var px = 8, h = 16;
		var inst = instance_place(x, y + 1, obj_square_16);
		var dy = px/abs(image_xscale);
		if (instance_exists(inst)) {
			inst.y += dy;
			inst.image_yscale -= dy/h;
			var new_slope = instance_create_layer(inst.x, y + h, layer, obj_slope_left_1);
			new_slope.image_yscale = dy/h;
			new_slope.image_xscale = new_slope.image_yscale * (image_xscale)/(image_yscale);
			if (image_xscale < 0)
				new_slope.x += abs(inst.sprite_width);
		}
	}


}
