function menu_edge_init() {
	edges_limit = 20;

	for (var i = 0; i < edges_limit; i++) {
		for (var k = 0; k < 4; k++) {
			menu_edges[i, k] = -1;
		}
	}



}
