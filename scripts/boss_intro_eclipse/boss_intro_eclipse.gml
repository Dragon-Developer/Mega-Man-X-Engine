function boss_intro_eclipse() {
	var tt = state_timer++;
	var limit = (boss_defeated) ? 60 : 600;
	if (tt >= limit - 1 && global.mobile) {
		loading_text = "Loading...";	
	}
	if (tt >= limit) {
		room_goto(boss_room);
		exit;
	}
	if (boss_defeated) {
		exit;
	}
	switch(floor(tt)) {
		case 0:
			music_play("BossIntroEclipse");
			layer_background_change(layer_bg, bg_boss_intro_x2);
			layer_background_blend(layer_bg, c_white);
			transition_create(transition_types.fade_in, 12);
			break;
		case 141:
			if (object_exists(boss_object))
				boss_inst = instance_create_depth(global.view_width/2, global.view_height/2, depth - 1, boss_object);	
			break;
		case 50:
			boss_intro_sprite = spr_boss_intro_x2;
		case 140:
		case 290:
			boss_intro_index = (tt == 50);
			if (tt != 290) audio_play(snd_thunder);
			else {
				audio_play(snd_boss_final_explode);
				layer_background_blend(layer_bg, c_black);
				boss_name_show = true;
			}
			var tran = transition_create(transition_types.fade_in);
			tran.wait_timer = 16;
			tran.color = c_white;
			break;
		case 490:
			var tran = transition_create(transition_types.fade_out);
			break;
		case 520:
			boss_intro_sprite = noone;
			boss_name_show = false;
			instance_try_destroy(boss_inst);
			break;
	}

	// Move Background
	layer_x(layer_id, layer_get_x(layer_id) + 6);


}
