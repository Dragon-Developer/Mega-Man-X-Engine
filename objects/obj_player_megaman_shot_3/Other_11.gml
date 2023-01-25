/// @description Step
event_inherited();

if (destroy) {
	h_speed = 0;
}
else {
	var t = timer++;
	if (t == 0) {
		audio_play(sound);
		var inst = instance_create_depth(x, y, depth, obj_player_megaman_shot_3_effect);
		inst.image_xscale = dir;
		inst.owner = owner;
		inst.owner_x = owner.x;
		inst.owner_y = owner.y;
		inst.shot_counted = false;
	}
	if (t < 5) player_shot_pos_fix();
	else if (t == 5) abs_hspeed = 5;
	else if (t >= 6 && t <= 8) abs_hspeed = 6;
	else if (t >= 9 && t <= 10) abs_hspeed = 6.5;
	else if (t >= 11 && t <= 12) abs_hspeed = 7;
	else if (t >= 13) abs_hspeed = 7.5;
	
	abs_hspeed = min(abs_hspeed, abs_hspeed_max);
	h_speed = abs_hspeed * dir;

	if (t >= 2) {
		animation_play("L");	
	}
}