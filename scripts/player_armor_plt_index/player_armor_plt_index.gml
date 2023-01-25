function player_armor_plt_index() {
	if (ds_map_exists(G.armor_plt_index, argument[0]))
		return G.armor_plt_index[? argument[0]];
	return 0;


}
