/// @function									background_list_set(z_index, array)
/// @description								Set background in z-index.
/// @param {real} z_index	 					Number after the underscore in layer name.
/// @param {Array<Struct.BGInfo>} BGInfo		Array of Backgrounds in phase order.
function background_list_set(z_index, array) {
	if (z_index < 1) return;
	global.background_list[| z_index - 1] = array_to_list(array);
	ds_list_mark_as_list(global.background_list, z_index - 1);
}
/// @function							BGInfo(sprite, far)
/// @description						Struct that contains background data.
/// @param {Asset.GMSprite} sprite		The index of the sprite.
/// @param {Real} far					How far is this background player on a scale of 0 to 1.
function BGInfo(sprite, far = -1) constructor {
	self.sprite = sprite;
	self.far = far;
}