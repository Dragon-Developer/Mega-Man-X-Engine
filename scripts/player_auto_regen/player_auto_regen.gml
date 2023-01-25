function player_auto_regen() {
	if (auto_regen) {
		if (state == auto_regen_state && !full_health) {
			var t = auto_regen_timer++;
			if (t >= auto_regen_limit) {
				var inst = instance_create_depth(0, 0, depth, obj_pickup_handler);
				inst.target = id;
				inst.pickup_pause = false;
				inst.pickup_type = pickup_types.hp;
				inst.amount = 2;
				inst.fill_sound = snd_item_weapon;
				inst.instant_fill = true;
				auto_regen_timer = 0;
				var effect = instance_create_layer(x, y, layer_up, auto_regen_object);
				effect.owner = id;
			}
		} else {
			auto_regen_timer = 0;	
		}
	}


}
