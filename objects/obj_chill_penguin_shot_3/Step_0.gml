PAUSE;
event_inherited();
if (h_speed == 0) {
	for (var i = 0; i < 5; i++) {
		var angle = 30 * (2 - i);
		if (angle_types == 1)
			angle = 22.5 * (2 - i);
		var inst = instance_create_depth(x + 11*dir, y, depth, obj_chill_penguin_shot_4);
		inst.dir = -dir;
		inst.xscale = dir;
		inst.h_speed = lengthdir_x(inst.abs_speed, angle) * inst.dir;
		inst.v_speed = lengthdir_y(inst.abs_speed, angle);
		inst.image_index = i;
	}
	audio_play(snd_ice_destroy);
	instance_destroy();	
}
if (!can_move_x(h_speed)) {
	h_speed = 0;	
}