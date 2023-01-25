/// @description Step
event_inherited();

var t = timer++;

if (t == 0 && is_main) {
	x = owner.x;
	audio_play(snd_player_x_shot_storm_tornado_2);
	var inst = instance_create_depth(x - sprite_width*dir, y, depth, object_index);
	inst.dir = -dir;
	ds_list_add(shots_group, inst);
	player_shot_sync_groups();
	with (inst) {
		event_perform(ev_step, ev_step_normal);
	}
}
if (t >= 1)
	abs_hspeed = 6;
	
visible = animation_t mod 2;

h_speed = abs_hspeed * dir;