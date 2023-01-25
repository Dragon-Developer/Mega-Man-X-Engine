/// @description Step
event_inherited();
var t = timer++;

if (t == 0)
{
	shots = [instance_create_depth(x - 4 * dir, y + 16*dir, depth + 1, obj_player_x_shot_x2_super2),
			instance_create_depth(x, y - 16*dir, depth - 1, obj_player_x_shot_x2_super2)];
	for (var i = 0; i < 2; i++)
	{
		var shot = shots[i];
		shot.dir = dir;
		shot.image_xscale = dir;
		shot.depths = [depth - 1, depth + 1];
		shot.shot_parent = self;
		ds_list_add(shots_group, shot);
	}
	player_shot_sync_groups();
	shots[0].index = 7;
}

if (destroy)
{
	h_speed = 0;
}
else
{
	abs_hspeed += 0.5;
	abs_hspeed = min(abs_hspeed, 6.5);

	h_speed = abs_hspeed * dir;
}