var t = timer++;
var inst = instance_place(x, y, obj_tile_lava);
if (t == 35) {
	grav = 0.125;
	v_speed = -1;
	limit_x[0] = floor((limit_x[0] - 32)/16)*16 + 8;
	limit_x[1] = floor((limit_x[1] + 16)/16)*16 - 8;
	var atk_player = irandom(2) == 1;
	if (atk_player) {
		dest_x = clamp(nearest_player.x, limit_x[0], limit_x[1]);
	}
	if (!atk_player || abs(dest_x - x) < 24) {
		if (dir == 1)
			dest_x = limit_x[1];
		else 
			dest_x = limit_x[0];
	}
	if (sign(dest_x - x) == dir)
		h_speed = (dest_x - x) / 48;
}
if (instance_exists(inst)) {
	if (y > inst.y) {
		persist = false;
		var inst = instance_create_depth(dest_x+24*dir, inst.y + 16, inst.depth - 1, obj_magma_dragoon_pillar);
		instance_destroy();
		exit;
	}
}