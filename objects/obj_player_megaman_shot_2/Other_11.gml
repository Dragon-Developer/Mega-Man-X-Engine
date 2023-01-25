/// @description Step
event_inherited();

if (destroy) {
	h_speed = 0;
}
else {
	var t = timer++;
	if (t == 0) {
		var inst = instance_create_depth(x, y, depth, obj_player_megaman_shot_2_effect);
		inst.image_xscale = dir;
		inst.owner = owner;
		inst.owner_x = owner.x;
		inst.owner_y = owner.y;
		inst.shot_counted = false;
	}
	if (t < 2) player_shot_pos_fix();
	else if (t >= 2 && t <= 11) abs_hspeed = 5;
	else if (t >= 12 && t <= 13) abs_hspeed = 5.5;
	else if (t >= 14 && t <= 15) abs_hspeed = 6;
	else if (t >= 16) abs_hspeed = 6.25;
	h_speed = abs_hspeed * dir;

	if (t == 2)
	{
		animation_play("L");	
	}
}