/// @description Load the Armor Menu graph corresponding to the given character
/// @param character
function menu_armor_load() {
	var character = argument[0];
	enum pl_btn {
		back,
		helmet,
		body,
		arms,
		legs,
		info,
		slots,
		armors,
		confirm
	}
	for (var i = pl_btn.confirm; i >= 0; i--) {
		item_sprite[i] = noone;
		item_rect[i] = [0, 0, 32, 32];
		item_pos[i] = [0, 0];
		item_scroll_pos[i] = [0, 0];
		item_image_index[i] = 0;
		item_show[i] = false;
		item_string[i] = "";
	}
	// Sprites
	item_sprite[pl_btn.back] = spr_armor_menu_back;
	item_sprite[pl_btn.armors] = spr_armor_menu_armors;
	item_sprite[pl_btn.confirm] = spr_armor_menu_confirm;
	item_sprite[pl_btn.info] = spr_armor_menu_info;
	// Positions
	item_pos[pl_btn.back] = [9, 9];
	item_pos[pl_btn.armors] = [9, 201];
	item_pos[pl_btn.confirm] = [277, 9];
	item_pos[pl_btn.info] = [280, 104];
	sprite_scroll = spr_armor_scroll;
	sprite_scroll_arrows = spr_armor_scroll_arrows;
	menu_edge_init();
	switch (character) {
		case pl_char.x:
			// Edges
			menu_add_edge(pl_btn.back, pl_btn.helmet, e_dir.right);
			menu_add_edge(pl_btn.back, pl_btn.armors, e_dir.down);
			menu_add_edge(pl_btn.helmet, pl_btn.confirm, e_dir.right);
			menu_add_edge(pl_btn.helmet, pl_btn.body, e_dir.down);
			menu_add_edge(pl_btn.body, pl_btn.arms, e_dir.down);
			menu_add_edge(pl_btn.arms, pl_btn.legs, e_dir.down);
			menu_add_edge(pl_btn.legs, pl_btn.armors, e_dir.left);
			menu_add_edge(pl_btn.legs, pl_btn.slots, e_dir.right);
			menu_add_edge(pl_btn.slots, pl_btn.info, e_dir.up);
			menu_add_edge(pl_btn.info, pl_btn.confirm, e_dir.up);
			// Armor
			item_pos[pl_btn.helmet] = [83, 11];
			item_pos[pl_btn.body] = [185, 47];
			item_pos[pl_btn.arms] = [49, 85];
			item_pos[pl_btn.legs] = [130, 140];
			item_sprite[pl_btn.helmet] = spr_armor_menu_helmet;
			item_sprite[pl_btn.body] = spr_armor_menu_body;
			item_sprite[pl_btn.arms] = spr_armor_menu_arms;
			item_sprite[pl_btn.legs] = spr_armor_menu_legs;
			// Slot
			item_sprite[pl_btn.slots] = spr_armor_menu_slots;
			item_pos[pl_btn.slots] = [280, 200];
			armors_length = x_armor.length;
			break;
		case pl_char.zero:
			armors_length = zero_armor.length;
			break;
		case pl_char.axl:
			armors_length = axl_armor.length;
			break;
	}
	if (character != pl_char.x) {
		menu_add_edge(pl_btn.back, pl_btn.confirm, e_dir.right);
		menu_add_edge(pl_btn.back, pl_btn.armors, e_dir.down);
		menu_add_edge(pl_btn.armors, pl_btn.info, e_dir.right);
		menu_add_edge(pl_btn.info, pl_btn.confirm, e_dir.up);	
	}

	for (var i = 0; i <= pl_btn.confirm; i++) {
		var pos = item_pos[i];
		var xx = pos[0];
		var yy = pos[1];
		var spr = item_sprite[i];
		if (spr != noone) {
			var rect = [];
			rect[0] = xx + sprite_get_bbox_left(spr);
			rect[1] = yy + sprite_get_bbox_top(spr);
			rect[2] = xx + sprite_get_bbox_right(spr);
			rect[3] = yy + sprite_get_bbox_bottom(spr);
			item_rect[i] = rect;
			item_show[i] = true;
			if (i >= pl_btn.helmet && i <= pl_btn.legs || i == pl_btn.armors) {
				var p = [];
				var ww = sprite_get_width(sprite_scroll);
				var hh = sprite_get_height(sprite_scroll);
				p[0] = floor((rect[0] + rect[2]) / 2 - ww / 2);
				p[1] = floor((rect[1] + rect[3]) / 2 - hh / 2);
				item_scroll_pos[i] = p;
			}
		}
	}
	item_scroll_pos[pl_btn.armors] = [9, 210];


}
