event_inherited();
sprite_index = global.pickup_lifeup_sprite;
if (instance_exists(obj_player_parent)) {
	plt_index = obj_player_parent.plt_index;
	plt_texture = obj_player_parent.plt_texture;
}