animations_destroy();
if (ds_exists(boss_damage, ds_type_map) )ds_map_destroy(boss_damage);
if (ds_exists(shots_group, ds_type_list)) ds_list_destroy(shots_group);