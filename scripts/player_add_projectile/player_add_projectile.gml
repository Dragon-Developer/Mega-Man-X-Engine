function player_add_projectile() {
	ds_queue_enqueue(projectiles_queue, (argument_count > 0 ? argument[0]: noone));


}
