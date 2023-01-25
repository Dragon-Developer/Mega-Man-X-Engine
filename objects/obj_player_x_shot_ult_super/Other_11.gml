/// @description Step
event_inherited();

var t = timer++;

if (t == 0) {
	var inst = instance_create_depth(x, y, depth, obj_player_x_shot_ult_effect);
	inst.image_xscale = dir;
	inst.owner = owner;
	inst.owner_x = owner.x;
	inst.owner_y = owner.y;
	inst.follow_owner = true;
	inst.shot_counted = false;
}
if (anti_destroy || !destroy) {
	if (t == 1)
		animation_play("S");
	if (t == 8) {
		animation_play("L");
		abs_hspeed = 4;
	}
	if (t < 8)
		player_shot_pos_fix();	
	else {
		abs_hspeed += 0.5;
		abs_hspeed = min(abs_hspeed, 7);
	}
	h_speed = abs_hspeed * dir;
}