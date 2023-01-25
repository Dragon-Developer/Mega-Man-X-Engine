// Inherit the parent even
event_inherited();
var t = timer++;
x = owner.x;
y = owner.y;
image_xscale = owner.dir;
dir = owner.dir;

if (t == 4) {
	var shot = instance_create_depth(x, y, depth - 1, obj_player_x_saber_wave);
	shot.dir = dir;
	shot.image_xscale = dir;
	shot.shot_parent = self;
	shot.h_speed = shot.abs_hspeed*dir;
	ds_list_add(shots_group, shot);
	player_shot_sync_groups();
}
if (t == 6)
	audio_play(snd_player_x_saber);