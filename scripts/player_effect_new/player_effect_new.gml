/// @description Add a new Player Effect
/// @param object
/// @param x_offset
/// @param y_offset
/// @param layer
/// @param timer_limit
/// @param script

var _layer = (argument_count > 3 ? argument[3] : layer_down);
var inst = instance_create_layer(argument[1], argument[2], _layer, obj_player_effect);

inst.timer_limit = (argument_count > 4 ? argument[4] : 0);
inst.script = (argument_count > 5 ? argument[5] : noone);
inst.object = argument[0];

return inst;