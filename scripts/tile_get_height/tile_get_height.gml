/// @description Returns the height of a given tile.
/// @param index The index of the tile.
/// @returns {number} The height of the tile
function tile_get_height(argument0) {

	var __index = argument0;

	var __reg = layer_tile_get_region(__index);
	if (array_length_1d(__reg) == 0)
		return 0;

	return __reg[3];
	


}
