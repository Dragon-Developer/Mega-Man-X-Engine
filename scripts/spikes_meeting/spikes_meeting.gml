/// @description Check if there are only spikes in that place
/// @param x
/// @param y
function spikes_meeting() {
	var _list = ds_list_create();
	var _size = instance_place_list(floor(argument[0]), floor(argument[1]), obj_square_parent, _list, false);
	var collide_spike = false;
	for (var i = 0; i < _size; i++) {
		var inst = _list[| i];
		if (inst.hit_player) {
			collide_spike = true;	
		} else {
			collide_spike = false;
			break;
		}
	}
	ds_list_destroy(_list);
	return collide_spike;


}
