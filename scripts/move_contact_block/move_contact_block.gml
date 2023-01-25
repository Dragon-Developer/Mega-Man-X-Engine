function move_contact_block(hsp, vsp, hstep = 1, vstep = 1) {
	var _x = x;
	var _y = y;

	var _hsp = ceil(hsp);
	var _vsp = ceil(vsp);

	var sign_hsp = sign(_hsp)*hstep;
	var sign_vsp = sign(_vsp)*vstep;

	while (_hsp != 0 || _vsp != 0) {
		if (!place_meeting(x + sign_hsp, y + sign_vsp, obj_block_parent)) {
			x += sign_hsp;
			y += sign_vsp;
			if (_vsp != 0) _vsp -= sign_vsp;
			if (_hsp != 0) _hsp -= sign_hsp;
		} else {
			_vsp = 0;
			_hsp = 0;
			if (place_meeting(x + sign_hsp, y, obj_block_parent)) {
				if (!place_meeting(floor(x), y, obj_block_parent)) {
					x = floor(x);	
				} else if (!place_meeting(ceil(x), y, obj_block_parent)) {
					x = ceil(x);	
				}
			}
			if (place_meeting(x, y + sign_vsp, obj_block_parent)) {
				if (!place_meeting(x, floor(y), obj_block_parent)) {
					y = floor(y);	
				} else if (!place_meeting(x, ceil(y), obj_block_parent)) {
					y = ceil(y);	
				}
			}
		}
	}

	return (x != _x || y != _y);


}
function move_y(spd) {
	if (through_walls || !place_meeting(x, y + spd, obj_block_parent)) {
		y += spd;	
	} else {
		move_contact_block(0, spd);	
	}
}