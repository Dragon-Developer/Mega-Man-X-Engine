if (!instance_exists(owner)) exit;
if (light) {
	scr_shader_set(shader_palette_light);
}
player_draw_healthbar(owner);
scr_shader_reset();
if (owner.is_player) {
	player_draw_weaponbar(owner);
	if (owner.double_gear_unlocked) {
		player_draw_double_gear(owner);	
	}
	with (obj_text) {
		visible = true;
		event_perform(ev_draw, 0);	
		visible = false;
	}
}