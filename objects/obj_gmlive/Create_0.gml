/// @description Don't forget to place this object in the first room!
// this is a simple safeguard against making multiple obj_gmlive instances
if (instance_number(obj_gmlive) > 1) {
	var first = instance_find(obj_gmlive, 0);
	if (id != first) { instance_destroy(); exit; }
}

// flip this value to 0 to disable GMLive!
#macro live_enabled 1

if (asset_get_index("live_init") == -1) show_error("live_init is missing!\nEither GMLive is not imported in the project, or the 'GMLive' script got corrupted (try re-importing)\nIf you don't have GMLive, you can safely remove obj_gmlive and any remaining live_* function calls.\n\n", 1);

// change the IP/port here if gmlive-server isn't running on the same device as the game
// (e.g. when running on mobile platforms):
live_init(1, "http://localhost:5100", "");