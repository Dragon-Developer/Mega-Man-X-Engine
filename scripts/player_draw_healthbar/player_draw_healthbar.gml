function player_draw_healthbar(p) {
	var xx = x_off + __view_get(e__VW.XView, 0);;
	var yy = y_off + __view_get(e__VW.YView, 0);;
	scr_draw_vertical_bar(
		xx,
		yy,
		bar_icon_sprite,
		bar_icon_index,
		p.hp,
		p.max_hp,
		p.max_bar_hp,
		spr_bar1_hp_unit,
		spr_bar1_area,
		spr_bar1_limit
	);
}
function player_draw_weaponbar(p) {
	var xx = 25 + __view_get(e__VW.XView, 0);
	var yy = 95 + __view_get(e__VW.YView, 0);
	if (!p.weapon_bar_show || p.weapon_icon[p.weapon[0]] == noone) exit;
	var wp = p.weapon[0];
	scr_draw_vertical_bar(
		xx,
		yy,
		spr_wpbar1_icon,
		p.weapon_icon[wp],
		p.weapon_energy[wp],
		p.weapon_energy_max[wp],
		p.weapon_energy_max[wp],
		spr_bar1_unit,
		spr_bar1_area,
		spr_bar1_limit,
		p.weapon_color[wp]
	);
}
function player_draw_double_gear(p) {
	var xx = x_off + __view_get(e__VW.XView, 0);
	var yy = y_off + __view_get(e__VW.YView, 0) + 17;
	var wp = weapons.speed_gear;
	var index = p.double_gear_icon_i;
	if (!p.speed_gear_enabled) {
		draw_sprite_ext(spr_double_gear_hud_red, index, xx, yy, 1, 1, 0, c_white, 1);
	} else {
		draw_sprite_ext(spr_double_gear_hud, 2*p.speed_gear + p.power_gear, xx, yy, 1, 1, 0, c_white, 1);	
		if (p.power_gear) {
			draw_sprite(spr_power_gear_icon, index, xx + 3, yy + 4);
		}
		if (p.speed_gear) {
			draw_sprite(spr_speed_gear_icon, index, xx + 17, yy + 4);
		}
	}
	var xs = ceil(21 * (p.weapon_energy_max[wp] - p.weapon_energy[wp]) / p.weapon_energy_max[wp]);
	draw_sprite_ext(spr_double_gear_unit, 2, xx + 4, yy + 20, xs, 1, 0, c_white, 1);
}