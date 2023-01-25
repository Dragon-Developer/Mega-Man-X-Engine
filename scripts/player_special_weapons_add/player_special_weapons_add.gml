function player_special_weapons_add(wp_state) {
	for (var i = 0, len = ds_list_size(special_weapons); i < len; i++) {
		var spi = special_weapons[| i];
		if (spi.index == wp_state) {
			exit;	
		}
	}
	var wp_info = player_special_weapon_from_state(wp_state);
	wp_info.index = wp_state;
	ds_list_add(special_weapons, wp_info);
}
function player_special_weapon_from_state(wp_state) {
	switch(wp_state)
	{
		case states.hadouken:
			return {
				check: player_check_hadouken,
				scr: player_state_hadouken
			};
		case states.shoryuken:
			return {
				check: player_check_shoryuken,
				scr: player_state_shoryuken
			};
		case states.tatsumaki:
			return {
				check: player_check_tatsumaki,
				scr: player_state_tatsumaki
			};
		case states.nova_strike:
			return {
				check: player_check_nova_strike,
				scr: player_state_nova_strike
			};
		case states.giga_falcon:
			return {
				check: player_check_giga_falcon,
				scr: player_state_giga_falcon
			};
		case states.messenko:
			return {
				check: player_check_messenko,
				scr: player_state_messenko
			};
		case states.giga_crush:
			return {
				check: player_check_giga_crush,
				scr: player_state_giga_crush
			};
		case states.speed_gear:
			return {
				check: player_check_speed_gear,
				scr: noone
			};
		default:
			return {};
	}
}