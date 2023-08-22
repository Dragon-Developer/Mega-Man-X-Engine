event_inherited();
var t = timer++;

if (destroy)
{
	h_speed = 0;
}
else
{
	if (t == 0) {
		var inst = instance_create_depth(x, y, depth, obj_player_zero_shot_x5_effect);
		inst.image_xscale = dir;
		inst.owner = owner;
		inst.owner_x = owner.x;
		inst.owner_y = owner.y;
		inst.follow_owner = true;
		inst.shot_counted = false;
	}
	if (t < start_frame) player_shot_pos_fix();
	else {
		if (t == start_frame) {
			abs_hspeed = abs_hspeed_max;
			animation_play("L");
		}
		abs_hspeed += 0.5;
		abs_hspeed = min(abs_hspeed, abs_hspeed_max);

		h_speed = abs_hspeed * dir;
	}
}