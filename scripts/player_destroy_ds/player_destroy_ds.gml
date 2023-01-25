function player_destroy_ds() {
	// Sprites
	ds_map_destroy(sprite_str);
	ds_map_destroy(sprite_shoot_str);

	ds_list_destroy(my_sprites);
	ds_list_destroy(my_sprites_shoot);

	ds_map_destroy(weapon_offset);
	ds_list_destroy(special_weapons);
	ds_list_destroy(effects_list);

	ds_map_destroy(weapon_overlay_sprite_map);
	ds_map_destroy(armor_order_map);
	ds_queue_destroy(projectiles_queue);
	ds_list_destroy(special_input_list);

	for (var i = 0; i < saber_skills.length; i++) {
		ds_map_destroy(saber_skill_boss_damage[i]);
	}



}
