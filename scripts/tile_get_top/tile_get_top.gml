/// @description Returns the top coordinate of a given tile from its background.
/// @param index The index of the tile.
/// @returns {number} The top of the tile
function tile_get_top(argument0) {

	var __index = argument0;

	var __reg = layer_tile_get_region(__index);
	if (array_length_1d(__reg) == 0)
		return 0;
	
	return __reg[1];


}
