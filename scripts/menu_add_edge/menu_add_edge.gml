/// @description This function will add a new edge from a source node (item_a) to a destination (item_b)
/// @param item_source
/// @param item_dest
/// @param dir_type
/// @param is_bidirectional (optional, true by default)
function menu_add_edge() {
	enum e_dir {
		up,
		down,
		left,
		right
	};
	var item_a = argument[0], item_b = argument[1], dir_type = argument[2];
	var is_bidirectional = (argument_count > 3 ? argument[3] : true);
	menu_edges[item_a, dir_type] = item_b;
	if (is_bidirectional) {
		var dir_type2 = 0;
		switch (dir_type) {
			case e_dir.up: dir_type2 = e_dir.down; break;
			case e_dir.down: dir_type2 = e_dir.up; break;
			case e_dir.left: dir_type2 = e_dir.right; break;
			case e_dir.right: dir_type2 = e_dir.left; break;
		}
		menu_edges[item_b, dir_type2] = item_a;
	}


}
