/// @description Returns the left coordinate of a given tile from its background.
/// @param index The index of the tile.
/// @returns {number} The width of the tile
function tile_get_left(argument0) {

	var __index = argument0;

	var __reg = layer_tile_get_region(__index);
	if (array_length(__reg) == 0)
		return 0;
	
	return __reg[0];


}
