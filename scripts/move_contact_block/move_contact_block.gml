var _x = x;
var _y = y;

var _hsp = ceil(argument[0]);
var _vsp = ceil(argument[1]);

var sign_hsp = sign(_hsp);
var sign_vsp = sign(_vsp);

while(_hsp != 0 || _vsp != 0)
{
	if (!place_meeting(x + sign_hsp, y + sign_vsp, obj_block_parent))
	{
		x += sign_hsp;
		y += sign_vsp;
		if (_vsp != 0) _vsp -= sign_vsp;
		if (_hsp != 0) _hsp -= sign_hsp;
	}
	else
	{
		_vsp = 0;	
		_hsp = 0;
	}
}

return (x != _x || y != _y);