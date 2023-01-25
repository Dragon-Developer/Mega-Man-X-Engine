switch(room)
{
	case rm_start:
		visible = false;
		break;
	case rm_mobile_gamepad:
	    if (x != draw_x || y != draw_y)
		{
			if (global.vkey[btn_type] != -1)
				virtual_key_delete(global.vkey[btn_type]);
			if (global.vkey[mobile_buttons.up] != -1 && object_index == obj_mobile_btn_dpad) {
				virtual_key_delete(global.vkey[mobile_buttons.up]);
				virtual_key_delete(global.vkey[mobile_buttons.down]);
				virtual_key_delete(global.vkey[mobile_buttons.left]);
				virtual_key_delete(global.vkey[mobile_buttons.right]);
			}
			draw_x = x;
			draw_y = y;
		}
		if (!global.mobile)
			instance_destroy();	
		previous_room = room;
		break;
	default:
		if (room != rm_start_menu) {
			if (!visible || previous_room != room || restart_button) {
				visible = true;
				restart_button = false;
				if (object_index == obj_mobile_btn_dpad) {
					var dir_buttons = [
						[mobile_buttons.up, 0, 0, 160, 56],
						[mobile_buttons.left, 0, 0, 60, 160],
						[mobile_buttons.right, 100, 0, 60, 160],
						[mobile_buttons.down, 0, 99, 160, 61],
					];
					for (var i = 0; i < 4; i++) {
						var bt = dir_buttons[i];
						var btype = bt[0];
						var _x = draw_x + bt[1]*image_xscale;
						var _y = draw_y + bt[2]*image_yscale;
						var _w = bt[3]*image_xscale;
						var _h = bt[4]*image_yscale;
						global.vkey[btype] = virtual_key_add(_x, _y, _w, _h, global.key_codes[btype]);
					}
				} else {
					if (btn_type != mobile_buttons.none) {
						global.vkey[btn_type] = virtual_key_add(draw_x, draw_y, sprite_width, sprite_height, global.key_codes[btn_type]);
					}
				}
			}
		} else {
			visible = false;	
		}
}
previous_room = room;