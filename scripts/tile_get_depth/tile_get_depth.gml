/// @description Returns the depth of a given tile.
/// @param index The index of the tile to check.
/// @returns {number} the depth of the tile
function tile_get_depth(argument0) {

	var __index = argument0;

	// Should really check if the element ID points to a tile (and not a different sort of element)
	var __layerid = layer_get_element_layer(__index);
	return layer_get_depth(__layerid);


}
