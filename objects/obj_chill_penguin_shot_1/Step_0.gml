PAUSE;
event_inherited();
if (h_speed == 0) {
	for (var i = 0; i < 2; i++) {
		var inst = instance_create_depth(x, y, depth, obj_chill_penguin_shot_4);
		inst.dir = -dir;
		inst.xscale = dir;
		if (shot_type == 0) {
			angle = 90 * (1 - i);
			inst.image_index = 2*i;
		} else if (shot_type == 1) {
			angle = 45 - 22.5*i;
			inst.image_index = i;
		}
		inst.image_xscale = dir;
		var hsp = array_get([4, 5, 8], global.difficulty); 
		inst.h_speed = lengthdir_x(hsp, angle) * inst.dir;
		inst.v_speed = lengthdir_y(hsp, angle);
	}
	audio_play(snd_ice_destroy);
	instance_destroy();	
}
if (!can_move_x(h_speed)) {
	h_speed = 0;	
}