surf = -1;
vx = 0;
vy = 0;
vw = 0;
vh = 0;
screen_color_init();
dark_area = false;
dark_area_alpha = 0;
dark_area_color = c_black;
dark_transition = false;
dark_area_light = true;
dark_area_r = [0, 0, 0, 0];
v = view_get_rectangle();
drawing_layers_on_surfaces = false;
drawing_layers_on_surfaces_previous = false;
layer_backs[0] = ds_list_create();
layer_backs[1] = ds_list_create();
layer_tilemaps[0] = ds_list_create();
layer_tilemaps[1] = ds_list_create();
layers = layer_get_all();
player_layer_id = layer_get_id("player");
enemy_layer_id = layer_get_id("entities");
camera_layer = layer_get_id("Camera"); // Changing it to "camera" would be better
for (var i = array_length(layers) - 1; i >= 0; i--) {
	var t_layer = layers[i];
	if (string_lower(string_copy(layer_get_name(t_layer), 1, 4)) == "tile") {
        var t_map_id = layer_tilemap_get_id(t_layer);
		if (layer_get_depth(t_layer) > layer_get_depth(player_layer_id)) {
			ds_list_add(layer_tilemaps[0], [t_layer, t_map_id]);
		} else {
			ds_list_add(layer_tilemaps[1], [t_layer, t_map_id]);
		}
		log("Added layer: " + layer_get_name(t_layer));
    }
	if (string_lower(string_copy(layer_get_name(t_layer), 1, 10)) == "background") {
		var t_bg_id = layer_background_get_id(t_layer);
		if (layer_get_depth(t_layer) > layer_get_depth(player_layer_id)) {
			ds_list_add(layer_backs[0], [t_layer, t_bg_id]);
		} 
		log("Added background: " + layer_get_name(t_layer));
	}
}
surfaces = [-1, -1, -1];
surface_dark_area = -1;
black_sprite = noone;
black_animation = 0;
player_inst = noone;
black_radius = 320;
black_surface = noone;