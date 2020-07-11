/// @param refresh_variables
var _refresh = false;
if (argument_count > 0) _refresh = argument[0];
if (_refresh) player_variables();
script_try(variables_script);
script_try(animation_script);
script_try(armor_script);
player_load_sprites();