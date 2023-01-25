if (destroy) {
	h_speed = 0;
}
else {
	var t = timer++;
	if (t == 2) {
		x = owner.x;
		y = owner.y;
		var inst = instance_create_depth(x, y, depth - 1, obj_player_megaman_shot_lightning_bolt_effect);
		inst.dir = dir;
		inst.owner = id;
		inst.owner_x = owner.x;
		inst.owner_y = owner.y;
		inst.shot_counted = false;
	}
	if (t > 50 && t mod 11 == 0 && shoot_times < 4) {
		var xx = __view_get(e__VW.XView, 0) + pos_x[shoot_times];
		var yy = __view_get(e__VW.YView, 0) - 49;
		var inst = instance_create_depth(xx, yy, depth, obj_player_megaman_shot_lightning_bolt_2);
		inst.dir = dir;
		inst.owner = id;
		inst.owner_x = owner.x;
		inst.owner_y = owner.y;
		inst.shot_counted = false;
		shoot_times++;
	}
}