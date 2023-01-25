// Needs refactoring...
v = view_get_rectangle();
vw = v[2] - v[0];
vh = v[3] - v[1];
vx = v[0];
vy = v[1];
#region Draw Layers on Surfaces
if (drawing_layers_on_surfaces) {
	if (!surface_exists(black_surface))
		black_surface = surface_create(320, 240);
	if (surface_exists(black_surface)) {
		surface_set_target(black_surface);
		draw_set_color(c_black);
		draw_clear_alpha(c_black, 1);
		var mid_x = floor(player_inst.x - vx);
		var mid_y = floor(player_inst.y - vy);
		draw_set_alpha(1);
		#region Black Animation (Giga Crush)
		switch (black_animation) {
			// Closing Circle
			case 1:
				gpu_set_blendmode(bm_subtract);
				draw_circle(mid_x, mid_y, black_radius, false);	
				break;
			// Draw Line in Player Position
			case 2:
				gpu_set_blendmode(bm_subtract);
				draw_line(mid_x - black_radius, mid_y, mid_x + black_radius, mid_y);
				break;
			// Draw White Circle with a Black circle in the middle
			case 3:
				gpu_set_blendmode(bm_subtract);
				draw_circle(mid_x, mid_y, black_radius + 16, false);
				gpu_set_blendmode(bm_normal);
				draw_circle(mid_x, mid_y, black_radius, false);
				break;
			// Draw a rectangle opening the screen horizontally	
			case 4:
				gpu_set_blendmode(bm_subtract);
				draw_rectangle(floor(mid_x - black_radius), 0, floor(mid_x + black_radius), global.view_height, false);
				break;
		}
		#endregion
		gpu_set_blendmode(bm_normal);
		draw_set_color(c_black);
		surface_reset_target();
	}
	for (var k = 0; k < 2; k++) {
		if (!surface_exists(surfaces[k])) {
			surfaces[k] = surface_create(320, 240);
		}
		if (surface_exists(surfaces[k])) {
			surface_set_target(surfaces[k]);
			draw_set_color(c_black);
			draw_clear_alpha(c_black, 0);
			draw_set_alpha(1);
			var layer_list, lsize;
			if (k == 0) {
				layer_list = layer_backs[k];
				lsize = ds_list_size(layer_list);
				for (var i = 0; i < lsize; i++) {
					var layer_info = layer_list[| i];
					if (black_animation > 2 && k == 0)
						draw_clear_alpha(c_white, 1);
					else {
						var _sprite = layer_background_get_sprite(layer_info[1]);
						var _subimg = layer_background_get_index(layer_info[1]);
						var _tiled = layer_background_get_htiled(layer_info[1]);
						var _xoffset = layer_get_x(layer_info[0]);
						var _yoffset = layer_get_y(layer_info[0]);
						if (sprite_exists(_sprite)) {
							if (_tiled)
								draw_sprite_tiled(_sprite, _subimg, _xoffset - vx, _yoffset - vy);
							else
								draw_sprite(_sprite, _subimg, _xoffset - vx, _yoffset - vy);
						}
					}
					layer_set_visible(layer_info[0], false);
				}
			}
			layer_list = layer_tilemaps[k];
			lsize = ds_list_size(layer_list);
			for (var i = 0; i < lsize; i++) {
				var layer_info = layer_list[| i];
				if (black_animation > 2 && k == 0)
					draw_clear_alpha(c_white, 1);
				else
					draw_tilemap(layer_info[1], -vx, -vy);
				if (black_animation < 2 && k == 0 && i == lsize - 1) {
					with (obj_door) {
						draw_on_surface = true;
						object_draw_on_surface();
					}	
				}
				layer_set_visible(layer_info[0], false);
			}
			draw_set_alpha(1);
			gpu_set_blendmode(bm_subtract);
			if (black_animation > 2 && k == 1)
				draw_clear_alpha(c_black, 0);
			else 
				draw_surface(black_surface, 0, 0);
			gpu_set_blendmode(bm_normal);
			surface_reset_target();
		}
	}
} else if (drawing_layers_on_surfaces_previous) {
	tilemap_layer_set_visible(true);
}
if (!drawing_layers_on_surfaces) {
	surface_free(black_surface);
}
drawing_layers_on_surfaces_previous = drawing_layers_on_surfaces;
#endregion
#region Draw Dark Area Surface
if (!surface_exists(surface_dark_area))
	surface_dark_area = surface_create(320, 240);
if (surface_exists(surface_dark_area) && black_animation <= 2) {
	if (black_animation > 0)
		draw_clear_alpha(c_black, 0);
	surface_set_target(surface_dark_area);
	draw_set_color(c_black);
	draw_clear_alpha(c_black, 0);
	dark_area = false;
	with (obj_dark_area) {
		var condition = (rectangle_in_rectangle(other.v[0], other.v[1], other.v[2], other.v[3], bbox_left, bbox_top, bbox_right, bbox_bottom));
		if (dark_transition && condition == 1) {
			other.dark_transition = true;
			other.dark_area = true;	
			other.dark_area_alpha = clamp(other.dark_area_alpha + 0.02, 0, image_alpha);
		} else if (condition >= 1) {
			other.dark_transition = false;
			other.dark_area = true;
			other.dark_area_alpha = image_alpha;
			other.dark_area_color = color;
			other.dark_area_light = !ignore_light;
			other.dark_area_r = [x, y, bbox_right, bbox_bottom];
		}
	}
	if (!dark_area && dark_transition) {
		dark_area_alpha = max(dark_area_alpha - 0.02, 0);
	}
	draw_set_alpha(1);
	if (dark_area_alpha > 0) {
		draw_set_color(dark_area_color);
		if (!dark_transition)
			draw_rectangle(max(x - vx, dark_area_r[0] - vx), 0, max(x - vx, dark_area_r[2] - vx), vh, false);
		else
			draw_rectangle(0, 0, vw, vh, false);
		draw_set_color(c_black);
		
			with (obj_light_parent) {
				if (is_inside_view()) {
					gpu_set_blendmode(bm_subtract);
					draw_sprite_ext(sprite_index, image_index, x - other.vx, y - other.vy, image_xscale, image_yscale, 0, c_white, alpha);		
					gpu_set_blendmode(bm_normal);
				}
			}
		
			with (obj_player_parent) {
				if (glow_enabled && visible && other.dark_area) {
					var _x = x, _y = y;
					if (state == states.ride) {
						_x = ride_char_pos.x;
						_y = ride_char_pos.y;	
					}
					if (state != states.ride || (ride_inst != noone && ride_inst.visible)) {
						var r = other.dark_area_r;
						glow_mode = rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, r[0], r[1], r[2], r[3]);
						gpu_set_blendmode(bm_subtract);
						if (glow_sprite != noone)
							draw_sprite_ext(glow_sprite, image_index, floor(_x - other.vx), floor(_y - other.vy), xscale, y_dir, 0, c_white, glow_alpha);
						player_draw_effect(effects.bottom, floor(_x - other.vx), floor(_y - other.vy));
						player_draw_effect(effects.top, floor(_x - other.vx), floor(_y - other.vy), true);
						gpu_set_blendmode(bm_normal);
					}
				}
				if (glow_in_dark && other.dark_area_light) {
				
					gpu_set_blendmode(bm_subtract);
					for (var i = 0, len = array_length(glow_circle_subtract); i < len; i++) {
						var circle = glow_circle_subtract[i];
						draw_set_alpha(circle.alpha);
						draw_circle_color(floor(x - other.vx), floor(y - other.vy), circle.radius, c_white, c_white, false);	
					}
					draw_set_alpha(1);
					gpu_set_blendmode(bm_normal);

				}
			}
		if (dark_area_light) {
			with (par_enemy) {
				if (visible && light) {
					var _x = x, _y = y;
					x = floor(x - other.vx);
					y = floor(y - other.vy);
					gpu_set_blendmode(bm_subtract);
					gpu_set_fog(true, c_white, 0, 0);	
					event_perform(ev_draw, 0);
					gpu_set_blendmode(bm_normal);
					gpu_set_fog(false, c_black, 0, 0);
					x = _x;
					y = _y;
				}
			}
			with (par_explosion) {
				if (visible) {
					var _x = x, _y = y;
					x = floor(x - other.vx);
					y = floor(y - other.vy);
					gpu_set_blendmode(bm_subtract);
					gpu_set_fog(true, c_white, 0, 0);	
					event_perform(ev_draw, 0);
					gpu_set_blendmode(bm_normal);
					gpu_set_fog(false, c_black, 0, 0);
					x = _x;
					y = _y;
				}
			}
			with (obj_player_pickup_parent) {
				if (visible) {
					gpu_set_blendmode(bm_subtract);
					gpu_set_fog(true, c_white, 0, 0);	
					draw_sprite_ext(sprite_index, image_index, floor(x - other.vx), floor(y - other.vy), image_xscale, image_yscale, 0, c_white, 1);	
					gpu_set_blendmode(bm_normal);
					gpu_set_fog(false, c_black, 0, 0);
				}
			}
		}
		if (surface_exists(black_surface)) {
			gpu_set_blendmode(bm_subtract);
			draw_surface(black_surface, 0, 0);
			gpu_set_blendmode(bm_normal);
		}
	}
	draw_set_alpha(1);
	surface_reset_target();
}
#endregion
#region Draw Bottom Surface + Players + Enemies + Top Surface
if (!surface_exists(surf)) {
    surf = surface_create(vw, vh);
}	
if (surface_exists(surf)) {
	surface_set_target(surf);	
	draw_set_color(c_black);
	draw_clear_alpha(c_black, 0);
	if (drawing_layers_on_surfaces && surface_exists(surfaces[0])) {
		draw_clear_alpha(c_black, 1);
		draw_set_alpha(1);
		screen_color_shader();
		draw_surface(surfaces[0], 0, 0);
		scr_shader_reset();
	}
	if (drawing_layers_on_surfaces) {
		surface_draw_set_objects([par_destructibleobject, par_enemy, par_tile, obj_player_parent], true);
		draw_objects([par_destructibleobject, par_enemy, par_tile, obj_player_parent], true);
	}
	if (surface_exists(surface_dark_area) && black_animation <= 2) {
		draw_set_alpha(dark_area_alpha);
		draw_surface(surface_dark_area, 0, 0);
		draw_set_alpha(1);
	}
	draw_objects([obj_player_effect_parent], true);
	surface_reset_target();
	draw_set_alpha(1);
	draw_surface(surf, vx, vy);
	if (drawing_layers_on_surfaces && surface_exists(surfaces[1])) {
		screen_color_shader();
		draw_surface(surfaces[1], vx, vy);
		scr_shader_reset();
	}
}
#endregion