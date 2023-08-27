/// @description Step
event_inherited();
var t = timer++;
if (t == 4) {
	var inst = instance_create_depth(x, y, depth, obj_player_zero_shin_messenko);
	inst.x = x;
	inst.y = y;
}