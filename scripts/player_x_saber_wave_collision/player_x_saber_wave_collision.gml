function player_x_saber_wave_collision() {
	var ene = argument[0];
	if (ene.hp <= 0) exit;
	var _x = ene.x;
	var _y = ene.y;
	var shot = instance_create_depth(_x, _y, depth, obj_player_x_saber_slashes);
	shot.target = ene;
	shot.dir = dir;
	shot.image_xscale = dir;
	shot.shot_parent = self;
	shot.h_speed = shot.abs_hspeed*dir;
	ds_list_add(shots_group, shot);
	player_shot_sync_groups();


}
