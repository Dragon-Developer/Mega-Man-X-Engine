if (surface_exists(surf)) {
	surface_free(surf);	
}
ds_list_destroy(layer_tilemaps[0]);
ds_list_destroy(layer_tilemaps[1]);
