function menu_armor_update_colors() {
	for (var i = 0; i <= pl_btn.confirm; i++) {
		item_image_index[i] = 1;	
	}
	for (var p = pl_btn.helmet; p <= pl_btn.armors; p++) {
		var part = 0;
		part = menu_get_armor_part_index(p);
		if (part >= 0) {
			if (tmp_armor[part] == "") {
				item_image_index[p] = 0;
			} else {
				item_image_index[p] = 1;	
			}
		}
	}
	item_image_index[selected_item] = 2;


}
