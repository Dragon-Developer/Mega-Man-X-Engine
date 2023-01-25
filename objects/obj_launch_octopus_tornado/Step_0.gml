PAUSE;
var mid_x = (bbox_right + bbox_left) / 2;
if (instance_exists(owner)) {
	if (owner.desperate) {
		player_speed = 2.5;
	}
	if (owner.state == OCTOPUS.ENERGY_DRAIN) {
		instance_destroy();
		exit;
	}
}
with (obj_player_parent) {
	if (!dead && state != states.grabbed) {
		if (abs(x - mid_x) < other.player_speed * other.local_game_speed || other.player_stuck) {
			x = mid_x;
			other.player_stuck = true;
		} else {
			move_x(other.player_speed * other.local_game_speed * sign(mid_x - x));
		}
	}
}

local_game_speed_update();
if (local_game_run_step) {
	animation_update(true);
	if (timer mod 30 == 0) {
		audio_play(snd_octopus_whirlwind);	
	}
	timer++;
	if (!instance_exists(obj_camera_rds)) exit;
	var v_id = obj_camera_rds.view_id;
	vx = __view_get(e__VW.XView, v_id);
	vy = __view_get(e__VW.YView, v_id);
	vw = __view_get(e__VW.WView, v_id);
	vh = __view_get(e__VW.HView, v_id);
	visible = animation_t mod 2;
	while (vy < y) {
		y -= 16;
		image_yscale += 1;
	}
	while (y + sprite_height < vy + vh) {
		image_yscale += 1;
	}
	if (timer >= timer_limit) {
		instance_destroy();
	}
}