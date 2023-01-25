/// @description Step
event_inherited();

if (destroy) {
	h_speed = 0;
}
else {
	var t = timer++;
	if (t == 0) {
		var inst = instance_create_depth(x, y, depth - 1, obj_player_megaman_shot_copy_vision_effect);
		inst.dir = dir;
		inst.owner = id;
		inst.owner_x = owner.x;
		inst.owner_y = owner.y;
		inst.shot_counted = false;
	}
	if (state == 0 && animation_end) {
		animation_play("L", 0);
		state = 1;
	}
	if (state == 1) {
		visible = t mod 3;
		if (animation_t == 1) {
			var inst = instance_create_depth(x + 18*dir, y, depth, obj_player_megaman_shot_copy_vision_ball);
			inst.dir = dir;
			inst.owner = id;
			inst.owner_x = owner.x;
			inst.owner_y = owner.y;
			inst.shot_counted = false;
			shoot_times--;
		}
	}
	if (instance_exists(owner) && (owner.key_p_wp1 || owner.key_p_wp2)) {
		shoot_times = 0;	
	}
	if (!shoot_times) {
		destroy = true;
		visible = true;
	}
}