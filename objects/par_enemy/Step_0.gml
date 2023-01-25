if (sprite_exists(colbox_sprite)) {
	mask_index = colbox_sprite;
}
enemy_behavior_normal();
if (local_game_run_step && !global.paused || (is_boss && global.pause_type == pause_types.boss_death)) {
	event_user(0);
	animation_update(image_index_update);
	if (animation_end && animation_end_destroy || (is_projectile && hp <= 0)) {
		instance_destroy();	
	}
}
if (!is_boss) {
	if (sprite_exists(hitbox_sprite)) {
		mask_index = hitbox_sprite;
	}	
}