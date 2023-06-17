// GMLive.gml (c) YellowAfterlife, 2017+
// PLEASE DO NOT FORGET to remove paid extensions from your project when publishing the source code!
// And if you are using git, you can exclude GMLive by adding
// `scripts/GMLive*` and `extensions/GMLive/` lines to your `.gitignore`.
// Feather disable all

// Loading rooms is hard work!
#region live.room_loader

if (live_enabled) 
function live_room_loader_run_cc(l_ccRaw, l_ccPath) {
	var l_ccError;
	var l_ccProgram = live_gmlive_patcher_compile_ex(l_ccPath, l_ccRaw);
	if (l_ccProgram == undefined) l_ccError = live_gmlive_patcher_error_text; else l_ccError = l_ccProgram.h_error_text;
	if (l_ccError == undefined) {
		live_custom_self = self;
		live_custom_other = other;
		var l_ccThread = l_ccProgram.h_call_v(l_ccPath, array_create(0));
		if (l_ccThread.h_status != 3) {
			l_ccError = l_ccThread.h_error_text;
			if (l_ccError == undefined) l_ccError = l_ccPath + ": unknown execution error";
		}
	}
	if (l_ccProgram != undefined) l_ccProgram.h_destroy();
	if (l_ccError != undefined) live_log(l_ccError, 2);
}

if (live_enabled) 
function live_room_loader_init_physics(l_phs) {
	if (l_phs == undefined) exit;
	if (l_phs[?"PhysicsWorld"]) {
		live_room_loader_use_physics = true;
		physics_world_create(l_phs[?"PhysicsWorldPixToMeters"]);
		physics_world_gravity(l_phs[?"PhysicsWorldGravityX"], l_phs[?"PhysicsWorldGravityY"]);
	} else live_room_loader_use_physics = false;
}

if (live_enabled) 
function live_room_loader_anim_speed(l_val, l_type) {
	if (l_type == "0") return l_val / room_speed; else return l_val;
}

if (live_enabled) 
function live_room_loader_run_yy_inst_cc(l_inst, l_qinst) {
	with (l_inst) {
		var l_rname = l_qinst[?"name"];
		event_perform(14, 0);
		var l_rcc = l_qinst[?"propertyCode"];
		if (l_rcc != undefined && l_rcc != "") live_room_loader_run_cc(l_rcc, l_rname + ":Properties");
		event_perform(ev_create, 0);
		l_rcc = l_qinst[?"creationCode"];
		if (l_rcc != undefined && l_rcc != "") live_room_loader_run_cc(l_rcc, l_rname + ":CreationCode");
	}
}

if (live_enabled) 
function live_room_loader_add_layer(l_ql) {
	var l_ql_depth = l_ql[?"depth"];
	var l_ql_name = l_ql[?"name"];
	var l_ql_sublayers = l_ql[?"layers"];
	var l_ql_sublayer_index, l_rl, l_i, l_n, l_f, l_s, l_aval, l_rx, l_ry;
	var l__g = l_ql[?"modelName"];
	if (l__g == undefined) {
		show_debug_message("Unknown layer type " + gml_std_Std_stringify(l_ql[?"modelName"]));
	} else switch (l__g) {
		case "GMRLayer":
			l_rl = layer_get_id(l_ql_name);
			if (l_rl == -1) {
				l_rl = layer_create(l_ql_depth, l_ql_name);
				if (l_ql[?"visible"] != undefined) layer_set_visible(l_rl, l_ql[?"visible"]);
			}
			if (l_ql_sublayers != undefined && l_ql_sublayers != pointer_null) {
				l_ql_sublayer_index = 0;
				var l__ = 0;
				for (var l__g1 = ds_list_size(l_ql_sublayers); l__ < l__g1; l__++) {
					live_room_loader_add_layer(ds_list_find_value(l_ql_sublayers, l_ql_sublayer_index));
					l_ql_sublayer_index++;
				}
			}
			break;
		case "GMRBackgroundLayer":
			if (live_room_loader_apply_backgrounds) {
				l_rl = layer_get_id(l_ql_name);
				if (l_rl == -1) {
					l_rl = layer_create(l_ql_depth, l_ql_name);
					if (l_ql[?"visible"] != undefined) layer_set_visible(l_rl, l_ql[?"visible"]);
				}
				if (l_ql_sublayers != undefined && l_ql_sublayers != pointer_null) {
					l_ql_sublayer_index = 0;
					var l__ = 0;
					for (var l__g1 = ds_list_size(l_ql_sublayers); l__ < l__g1; l__++) {
						live_room_loader_add_layer(ds_list_find_value(l_ql_sublayers, l_ql_sublayer_index));
						l_ql_sublayer_index++;
					}
				}
				var l_qb = l_ql;
				l_s = l_qb[?"sprite"];
				var l_rb = layer_background_create(l_rl, (l_s != undefined ? asset_get_index(l_s) : -1));
				l_aval = l_qb[?"color"];
				if (l_aval < 0) l_aval += 4294967296.;
				if (l_aval != undefined) {
					layer_background_blend(l_rb, (l_aval & 16777215));
					layer_background_alpha(l_rb, ((l_aval >> 24) / 255));
				}
				l_aval = l_qb[?"htiled"];
				if (l_aval != undefined) layer_background_htiled(l_rb, l_aval); else layer_background_htiled(l_rb, true);
				l_aval = l_qb[?"vtiled"];
				if (l_aval != undefined) layer_background_vtiled(l_rb, l_aval); else layer_background_vtiled(l_rb, true);
				l_aval = l_qb[?"stretch"];
				if (l_aval != undefined) layer_background_stretch(l_rb, l_aval); else layer_background_stretch(l_rb, false);
				l_aval = l_qb[?"animationFPS"];
				if (l_aval != undefined) layer_background_speed(l_rb, live_room_loader_anim_speed(l_aval, l_qb[?"animationSpeedType"]));
				l_aval = l_qb[?"x"];
				if (l_aval == undefined) l_aval = 0;
				layer_x(l_rl, live_room_loader_room_x + l_aval);
				l_aval = l_qb[?"y"];
				if (l_aval == undefined) l_aval = 0;
				layer_y(l_rl, live_room_loader_room_y + l_aval);
			}
			break;
		case "GMRTileLayer":
			if (live_room_loader_apply_tiles) {
				l_rl = layer_get_id(l_ql_name);
				if (l_rl == -1) {
					l_rl = layer_create(l_ql_depth, l_ql_name);
					if (l_ql[?"visible"] != undefined) layer_set_visible(l_rl, l_ql[?"visible"]);
				}
				if (l_ql_sublayers != undefined && l_ql_sublayers != pointer_null) {
					l_ql_sublayer_index = 0;
					var l__ = 0;
					for (var l__g1 = ds_list_size(l_ql_sublayers); l__ < l__g1; l__++) {
						live_room_loader_add_layer(ds_list_find_value(l_ql_sublayers, l_ql_sublayer_index));
						l_ql_sublayer_index++;
					}
				}
				var l_qt = l_ql;
				var l_qtt = l_qt[?"tiles"];
				var l_qtb64 = l_qtt[?"TileSerialiseDataZL"];
				var l_qtw = l_qtt[?"SerialiseWidth"];
				var l_qth = l_qtt[?"SerialiseHeight"];
				var l_tileset1 = (is_string(l_qt[?"tileset"]) ? asset_get_index(l_qt[?"tileset"]) : -1);
				var l_rx = 0;
				var l_ry = 0;
				var l_rt = layer_tilemap_create(l_rl, live_room_loader_room_x + l_qt[?"x"], live_room_loader_room_y + l_qt[?"y"], l_tileset1, l_qtw, l_qth);
				if (is_string(l_qtb64)) {
					var l_qtbz = buffer_base64_decode(l_qtb64);
					if (l_qtbz == -1) show_error("Couldn't decode base64-decoded data", true);
					var l_qtb = buffer_decompress(l_qtbz);
					if (l_qtb == -1) show_error("Couldn't decompress ZLIB-compressed tile data", true);
					var l_qti = 0;
					var l_y = 0;
					for (var l__g1 = l_qth; l_y < l__g1; l_y++) {
						var l_x = 0;
						for (var l__g3 = l_qtw; l_x < l__g3; l_x++) {
							var l_td = buffer_peek(l_qtb, l_qti * 4, buffer_u32);
							l_qti++;
							if (tile_get_empty(l_td)) l_td = 0;
							tilemap_set(l_rt, l_td, l_rx + l_x, l_ry + l_y);
						}
					}
					buffer_delete(l_qtbz);
					buffer_delete(l_qtb);
				} else {
					var l_qtd = l_qtt[?"TileSerialiseData"];
					var l_qti = 0;
					var l_y = 0;
					for (var l__g1 = l_qth; l_y < l__g1; l_y++) {
						var l_x = 0;
						for (var l__g3 = l_qtw; l_x < l__g3; l_x++) {
							var l_td = ds_list_find_value(l_qtd, l_qti++);
							if (tile_get_empty(l_td)) l_td = 0;
							tilemap_set(l_rt, l_td, l_rx + l_x, l_ry + l_y);
						}
					}
				}
			}
			break;
		case "GMRInstanceLayer":
			if (live_room_loader_apply_instances) {
				l_rl = layer_get_id(l_ql_name);
				if (l_rl == -1) {
					l_rl = layer_create(l_ql_depth, l_ql_name);
					if (l_ql[?"visible"] != undefined) layer_set_visible(l_rl, l_ql[?"visible"]);
				}
				if (l_ql_sublayers != undefined && l_ql_sublayers != pointer_null) {
					l_ql_sublayer_index = 0;
					var l__ = 0;
					for (var l__g1 = ds_list_size(l_ql_sublayers); l__ < l__g1; l__++) {
						live_room_loader_add_layer(ds_list_find_value(l_ql_sublayers, l_ql_sublayer_index));
						l_ql_sublayer_index++;
					}
				}
				var l_qi = l_ql;
				l_rx = live_room_loader_room_x;
				l_ry = live_room_loader_room_y;
				var l_instances = l_qi[?"instances"];
				l_n = ds_list_size(l_instances);
				var l_base = live_blank_object;
				if (l_n != 0) {
					if (!object_exists(l_base)) show_error("Please add a blank object and set live_blank_object to point at it in obj_gmlive's create event.", true);
				}
				var l_lco = live_room_loader_object_cache;
				l_i = l_n;
				while (--l_i >= 0) {
					var l_qinst = ds_list_find_value(l_instances, l_i);
					var l_rnext = instance_create_layer((l_rx + l_qinst[?"x"]), (l_ry + l_qinst[?"y"]), l_rl, l_base);
					var l_qid = l_qinst[?"name"];
					ds_map_set(live_room_loader_inst_map_yy, l_qid, l_qinst);
					ds_map_set(live_room_loader_inst_map_gml, l_qid, l_rnext);
					with (l_rnext) {
						gml_const_add(l_qinst[?"name"], real(int64(self.id)));
						l_aval = l_qinst[?"rotation"];
						if (l_aval != undefined) self.image_angle = l_aval;
						l_aval = l_qinst[?"scaleX"];
						if (l_aval != undefined) self.image_xscale = l_aval;
						l_aval = l_qinst[?"scaleY"];
						if (l_aval != undefined) self.image_yscale = l_aval;
						l_aval = l_qinst[?"imageIndex"];
						if (l_aval != undefined) self.image_index = l_aval;
						l_aval = l_qinst[?"imageSpeed"];
						if (l_aval != undefined) self.image_speed = l_aval;
						l_f = l_qinst[?"color"];
						if (l_f < 0) l_f += 4294967296.;
						if (l_f != undefined) {
							self.image_blend = (l_f & 16777215);
							self.image_alpha = (l_f >> 24) / 255;
						}
						l_s = l_qinst[?"obj"];
						var l_id = ds_map_find_value(l_lco, l_s);
						if (l_id == undefined) {
							l_id = asset_get_index(l_s);
							ds_map_set(l_lco, l_s, l_id);
						}
						instance_change(l_id, false);
					}
				}
			}
			break;
		case "GMRAssetLayer":
			if (live_room_loader_apply_sprites) {
				l_rl = layer_get_id(l_ql_name);
				if (l_rl == -1) {
					l_rl = layer_create(l_ql_depth, l_ql_name);
					if (l_ql[?"visible"] != undefined) layer_set_visible(l_rl, l_ql[?"visible"]);
				}
				if (l_ql_sublayers != undefined && l_ql_sublayers != pointer_null) {
					l_ql_sublayer_index = 0;
					var l__ = 0;
					for (var l__g1 = ds_list_size(l_ql_sublayers); l__ < l__g1; l__++) {
						live_room_loader_add_layer(ds_list_find_value(l_ql_sublayers, l_ql_sublayer_index));
						l_ql_sublayer_index++;
					}
				}
				var l_sprites = l_ql[?"assets"];
				l_n = ds_list_size(l_sprites);
				var l_lcs = live_room_loader_sprite_cache;
				l_rx = live_room_loader_room_x;
				l_ry = live_room_loader_room_y;
				l_i = -1;
				while (++l_i < l_n) {
					var l_qspr = ds_list_find_value(l_sprites, l_i);
					l_s = l_qspr[?"sprite"];
					var l_rspr = l_rx + l_qspr[?"x"];
					var l_rspr1 = l_ry + l_qspr[?"y"];
					var l_id = ds_map_find_value(l_lcs, l_s);
					if (l_id == undefined) {
						l_id = asset_get_index(l_s);
						ds_map_set(l_lcs, l_s, l_id);
					}
					var l_rspr2 = layer_sprite_create(l_rl, l_rspr, l_rspr1, l_id);
					l_aval = l_qspr[?"frameIndex"];
					if (l_aval != undefined) layer_sprite_index(l_rspr2, l_aval);
					l_aval = l_qspr[?"scaleX"];
					if (l_aval != undefined) layer_sprite_xscale(l_rspr2, l_aval);
					l_aval = l_qspr[?"scaleY"];
					if (l_aval != undefined) layer_sprite_yscale(l_rspr2, l_aval);
					l_aval = l_qspr[?"rotation"];
					if (l_aval != undefined) layer_sprite_angle(l_rspr2, l_aval);
					l_f = l_qspr[?"color"];
					if (l_f < 0) l_f += 4294967296.;
					if (l_f != undefined) {
						layer_sprite_blend(l_rspr2, (l_f & 16777215));
						layer_sprite_alpha(l_rspr2, ((l_f >> 24) / 255));
					}
					if (l_qspr[?"animationFPS"] != undefined) layer_sprite_speed(l_rspr2, live_room_loader_anim_speed(l_qspr[?"animationFPS"], l_qspr[?"animationSpeedType"]));
				}
			}
			break;
		case "GMREffectLayer":
			if (live_room_loader_apply_filters) {
				l_rl = layer_get_id(l_ql_name);
				if (l_rl == -1) {
					l_rl = layer_create(l_ql_depth, l_ql_name);
					if (l_ql[?"visible"] != undefined) layer_set_visible(l_rl, l_ql[?"visible"]);
				}
				if (l_ql_sublayers != undefined && l_ql_sublayers != pointer_null) {
					l_ql_sublayer_index = 0;
					var l__ = 0;
					for (var l__g1 = ds_list_size(l_ql_sublayers); l__ < l__g1; l__++) {
						live_room_loader_add_layer(ds_list_find_value(l_ql_sublayers, l_ql_sublayer_index));
						l_ql_sublayer_index++;
					}
				}
				var l_fxl = l_ql;
				l_s = l_fxl[?"effectType"];
				if (l_s == undefined || l_s == pointer_null) exit;
				var l_fx1 = fx_create(l_s);
				var l__g_list = l_fxl[?"properties"];
				var l__g_index = 0;
				while (l__g_index < ds_list_size(l__g_list)) {
					var l_pp = ds_list_find_value(l__g_list, l__g_index++);
					switch (l_pp[?"type"]) {
						case 1:
							l_s = l_pp[?"value"];
							if (string_ord_at(l_s, 1) != 35) continue;
							l_f = real(int64(ptr(string_delete(l_s, 1, 1))));
							if (l_f < 0) l_f += 4294967296.;
							fx_set_parameter(l_fx1, l_pp[?"name"], l_f % 256 / 255, (l_f / 256 | 0) % 256 / 255, (l_f / 65536 | 0) % 256 / 255, (l_f / 16777216 | 0) / 255);
							break;
						case 0:
							l_f = real(l_pp[?"value"]);
							fx_set_parameter(l_fx1, l_pp[?"name"], l_f);
							break;
						case 2:
							l_s = l_pp[?"value"];
							if (l_s == undefined || l_s == pointer_null) continue;
							l_f = asset_get_index(l_s);
							if (l_f != -1) fx_set_parameter(l_fx1, l_pp[?"name"], l_f);
							break;
						default: live_log("Unknown effect parameter type " + string(l_pp[?"type"]), 1);
					}
				}
				layer_set_fx(l_rl, l_fx1);
			}
			break;
		case "GMRPathLayer": break;
		default: show_debug_message("Unknown layer type " + gml_std_Std_stringify(l_ql[?"modelName"]));
	}
}

if (live_enabled) 
function live_room_loader_run_impl2(l_rm) {
	live_log("Loading " + l_rm[?"name"] + "...", 0);
	ds_map_clear(live_room_loader_inst_map_gml);
	ds_map_clear(live_room_loader_inst_map_yy);
	if (live_room_loader_apply_settings) {
		room_width = l_rm[?"roomSettings"][?"Width"];
		room_height = l_rm[?"roomSettings"][?"Height"];
		live_room_loader_init_physics(l_rm[?"physicsSettings"]);
	}
	var l_aval;
	if (live_room_loader_apply_views) {
		l_aval = l_rm[?"viewSettings"][?"enableViews"];
		if (l_aval != undefined) view_enabled = l_aval; else view_enabled = false;
		var l_qvs = l_rm[?"views"];
		if (l_qvs != undefined) {
			var l_i = 0;
			for (var l__g1 = ds_list_size(l_qvs); l_i < l__g1; l_i++) {
				var l_qv = ds_list_find_value(l_qvs, l_i);
				if (l_qv == undefined) continue;
				var l_rv = l_i;
				l_aval = l_qv[?"visible"];
				if (l_aval != undefined) view_visible[l_rv] = l_aval; else view_visible[l_rv] = false;
				l_aval = l_qv[?"xport"];
				if (l_aval != undefined) view_xport[l_rv] = l_aval; else view_xport[l_rv] = 0;
				l_aval = l_qv[?"yport"];
				if (l_aval != undefined) view_yport[l_rv] = l_aval; else view_yport[l_rv] = 0;
				l_aval = l_qv[?"wport"];
				if (l_aval != undefined) view_wport[l_rv] = l_aval; else view_wport[l_rv] = 1024;
				l_aval = l_qv[?"hport"];
				if (l_aval != undefined) view_hport[l_rv] = l_aval; else view_hport[l_rv] = 768;
				var l_rc = view_camera[l_rv];
				var l_vx, l_vy;
				l_vx = l_qv[?"xview"];
				if (l_vx == undefined) l_vx = 0;
				l_vy = l_qv[?"yview"];
				if (l_vy == undefined) l_vy = 0;
				camera_set_view_pos(l_rc, live_room_loader_room_x + l_vx, live_room_loader_room_y + l_vy);
				l_vx = l_qv[?"wview"];
				if (l_vx == undefined) l_vx = 1024;
				l_vy = l_qv[?"hview"];
				if (l_vy == undefined) l_vy = 768;
				camera_set_view_size(l_rc, l_vx, l_vy);
				l_aval = l_qv[?"obj"];
				if (l_aval != undefined) camera_set_view_target(l_rc, asset_get_index(l_aval));
				l_vx = l_qv[?"hspeed"];
				if (l_vx == undefined) l_vx = -1;
				l_vy = l_qv[?"vspeed"];
				if (l_vy == undefined) l_vy = -1;
				camera_set_view_speed(l_rc, l_vx, l_vy);
				l_vx = l_qv[?"hborder"];
				if (l_vx == undefined) l_vx = 32;
				l_vy = l_qv[?"vborder"];
				if (l_vy == undefined) l_vy = 32;
				camera_set_view_border(l_rc, l_vx, l_vy);
			}
		}
	}
	var l_lrs = l_rm[?"layers"];
	var l_lrk = ds_list_size(l_lrs);
	while (--l_lrk >= 0) {
		live_room_loader_add_layer(ds_list_find_value(l_lrs, l_lrk));
	}
	var l__g_list = l_rm[?"instanceCreationOrderIDs"];
	var l__g_index = 0;
	while (l__g_index < ds_list_size(l__g_list)) {
		var l_id = ds_list_find_value(l__g_list, l__g_index++);
		var l_qinst = ds_map_find_value(live_room_loader_inst_map_yy, l_id);
		if (l_qinst == undefined) {
			live_log(l_id + " is in instanceCreationOrderIDs but no instance exists.", 1);
			continue;
		}
		live_room_loader_run_yy_inst_cc(ds_map_find_value(live_room_loader_inst_map_gml, l_id), l_qinst);
	}
	ds_map_clear(live_room_loader_inst_map_gml);
	ds_map_clear(live_room_loader_inst_map_yy);
	var l_s = l_rm[?"creationCode"];
	if (l_s != undefined && l_s != "") live_room_loader_run_cc(l_s, l_rm[?"name"] + ":CreationCode");
}

function live_room_start() {
	if (live_enabled) {
		var l_rq = live_live_room;
		if (!room_exists(l_rq)) show_error("No live room was specified.", true);
		var l_rd = ds_map_find_value(live_live_room_data, l_rq);
		if (l_rd == undefined) {
			live_log("Warning: no live data had been received yet for " + room_get_name(l_rq) + ", transitioning to the regular version.", 1);
			room_goto(l_rq);
			exit;
		}
		var l_rm2 = json_decode(l_rd);
		live_room_loader_run_impl2(l_rm2);
		ds_map_destroy(l_rm2);
	}
}

#endregion
