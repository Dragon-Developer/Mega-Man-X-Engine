/// @description Insert description here
// You can write your code in this editor
inside_view = is_inside_view();

if (!inside_view) {
	visible = false;
} else {
	if (!is_temporary) {
		visible = true;
	}
	else {
		if (timer + blink_limit >= timer_limit && local_game_run_step) {
			visible = !visible;
		} else {
			visible = true;	
		}
	}
	with (obj_player_parent) {
		if (place_meeting(x, y, other) && !instance_exists(other.target)) {
			other.target = id;	
		}
	}

	if (target != noone) {
		var inst = instance_create_depth(x, y, 0, obj_pickup_handler);
		inst.amount = amount;
		inst.pickup_type = pickup_type;
		inst.pickup_pause = pickup_pause;
		inst.time_per_unit = time_per_unit;
		inst.wait_timer = wait_limit;
		inst.min_limit = min_limit;
		inst.target = target;
		inst.bar_light = bar_light;
		audio_play(sound);
		instance_destroy();
		exit;
	}
}
if (is_temporary && local_game_run_step) {
	timer++;
}
if (is_temporary && timer >= timer_limit) {
	instance_destroy();
}