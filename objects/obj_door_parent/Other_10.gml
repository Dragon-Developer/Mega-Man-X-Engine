/// @description Handle player animation
if (state == door_states.open && !moving_target) {
	target.animation_ignore_frame = 0;
	target.v_speed = 0;
	target.h_speed = 0;

	if (is_vertical && dir == 1) {
		with (target) {
			animation_play("fall", 8);
			state_set(states.fall, 8);
		}
	} else if (!target.animation_is_looping) {
		target.animation_ignore_frame = 1;
	}
} else {
	if (!moving_target && boss_door)
		pause_set(false);
	with (target) {
		player_disable_speed_gear();
		player_dolor_reset();
		player_saber_reset(false);
		player_effects_reset();
		immunity = false;
		shoot_enabled = true;
		audio_stop(hover_sound);
		if (!other.is_vertical) {
			animation_ignore_frame = 0;
			if (!other.moving_target) {
				player_check_idle();	
			} else if (is_on_floor() && !is_on_ceil() && state != states.dash && state != states.fall) {
				animation_play("walk");
				state_set(states.walk);
			}
			if (other.moving_target && !animation_is_looping && state != states.walk) {
				animation_ignore_frame = 1;
			}
			if (!other.moving_target && state != states.jump && state != states.fall) {
				player_check_fall();
			}
		} 
	}
}