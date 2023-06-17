/// @description  d3d - set fog enable/disable and colour
/// @param enable true if enabled, false if disabled
/// @param colour	colour of the fog
/// @param near	distance to when fog starts
/// @param far	distance to when fog becomes absolute
function d3d_set_fog(argument0, argument1, argument2, argument3) {

	gpu_set_fog(argument0, argument1, argument2, argument3 );


}
