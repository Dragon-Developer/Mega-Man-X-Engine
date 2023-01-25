function player_immunity() {
	for (var i = 0; i < ds_list_size(immunity_list); i++) {
		var im = immunity_list[| i];
		im.update(id);
		if (!im.activated) {
			ds_list_delete(immunity_list, i--);
		}
	}
	var blink_previous = blink;
	blink = false;
	immunity = false;
	death_by_spike = true;
	for (var i = 0; i < ds_list_size(immunity_list); i++) {
		var im = immunity_list[| i];
		blink |= im.blink;
		immunity |= (im.type != immunity_types.spike && im.type != immunity_types.none);
		death_by_spike &= !im.spike;
	}
	if (blink_previous && !blink) {
		visible = true;
	}

	if (blink) {
		blink_t += blink_speed;
	
		if (blink_t >= 1) {
			blink_t = 0;
			visible = !visible;
		}
	}
}
/// @param type
/// @param length
/// @param blink
/// @param spike
/// @param state
function Immunity(_type, _length = -1, _blink = false, _spike = false, _state = -1) constructor {
	timer = 0;
	length = _length;
	type = _type;
	blink = _blink;
	state = _state;
	spike = _spike;
	activated = true;
	function update(obj) {
		if ((timer >= length && length >= 0) || (state != -1 && obj.state != state)) {
			activated = false;
		}
		timer++;
	}
}