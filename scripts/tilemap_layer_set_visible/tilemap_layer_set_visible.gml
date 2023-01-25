function tilemap_layer_set_visible() {
	with(obj_surface) {
		for (var k = 0; k < 2; k++) {
			var layer_list = layer_tilemaps[k];
			for (var i = 0; i < ds_list_size(layer_list); i++) {
				var layer_info = layer_list[| i];
				layer_set_visible(layer_info[0], argument[0]);
			}
		}
	}


}
