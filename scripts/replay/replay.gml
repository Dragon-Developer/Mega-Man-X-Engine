/// @description	Initialize Replay Variables
function replay_init() {
	random_set_seed(0);
	global.replay_frame = 0;
	global.replay_input = ds_list_create();
	global.replay_file = noone;
	if (!global.mobile) {
		var cmd = parameter_count() > 1 ? parameter_string(1) : "";
		switch (cmd) {
			case "record":
				global.recording_replay = true;
				if (parameter_count() > 2) {
					global.replay_fname	= parameter_string(2);
					global.replay_fname = "Replays/" + global.replay_fname;
				}
				if (parameter_count() == 2 || file_exists(global.replay_fname)) {
					var i = 0;
					do {
						i++;
						global.replay_fname = "Replays/" + string(i) + ".replay";
					} until (!file_exists(global.replay_fname));
				}
				global.replay_file = file_bin_open(global.replay_fname, 1); // Write mode
				file_bin_rewrite(global.replay_file);
				file_bin_seek(global.replay_file, 0);
				break;
			case "replay":
				global.replay_fname = parameter_string(2);
				global.replay_fname = "Replays/" + global.replay_fname;
				if (file_exists(global.replay_fname)) {
					global.running_replay = true;
					global.replay_file = file_bin_open(global.replay_fname, 0);
					var c, c1, c2;
					for (var i = 0, size = file_bin_size(global.replay_file); i < size; i += 2) {
						c = 0;
						c1 = file_bin_read_byte(global.replay_file);
						c2 = 0;
						if (i + 1 < size) {
							c2 = (file_bin_read_byte(global.replay_file));
						}
						c = (c2 << 8) + c1;
						ds_list_add(global.replay_input, c);
					}
					file_bin_close(global.replay_file);
				}
				break;
		}
	}
}
/// @description Replay Recording Step
function replay_record_update(o) {
	if (!global.recording_replay) exit;
	with (o) {
		var c	= (key_left		<< 0)
				+ (key_right	<< 1) 
				+ (key_up		<< 2)
				+ (key_down		<< 3)
				+ (key_jump		<< 4)
				+ (key_dash		<< 5)
				+ (key_shoot	<< 6)
				+ (key_shoot2	<< 7)
		var c2	= (key_special	<< 0)
				+ (key_wp1		<< 1)
				+ (key_wp2		<< 2)
				+ (key_start	<< 3);
		file_bin_write_byte(global.replay_file, c);
		file_bin_write_byte(global.replay_file, c2);
	}
}
/// @description Replay update
function replay_update() {
	var o = obj_start_menu;
	if (!instance_exists(o)) {
		o = instance_find(obj_player_parent, 0);
	}
	if (global.running_replay) {
		if (global.replay_frame < ds_list_size(global.replay_input)) {
			var c = global.replay_input[| global.replay_frame++];
			with (o) {
				key_p_left		= !key_left && ((c & (1 << 0)) > 0);
				key_left		= (c & (1 << 0)) > 0;
				
				key_p_right		= !key_right && ((c & (1 << 1)) > 0);
				key_right		= (c & (1 << 1)) > 0;
				
				key_p_up		= !key_up && ((c & (1 << 2)) > 0);
				key_up			= (c & (1 << 2)) > 0;
				
				key_p_down		= !key_down && ((c & (1 << 3)) > 0);
				key_down		= (c & (1 << 3)) > 0;
				
				key_p_jump		= !key_jump && ((c & (1 << 4)) > 0);
				key_jump		= (c & (1 << 4)) > 0;
				
				key_p_dash		= !key_dash && ((c & (1 << 5)) > 0);
				key_dash		= (c & (1 << 5)) > 0;
				
				key_p_shoot		= !key_shoot && ((c & (1 << 6)) > 0);
				key_shoot		= (c & (1 << 6)) > 0;
				
				key_p_shoot2	= !key_shoot2 && ((c & (1 << 7)) > 0);
				key_shoot2		= (c & (1 << 7)) > 0;
				
				key_p_special	= !key_special && ((c & (1 << 8)) > 0);
				key_special		= (c & (1 << 8)) > 0;	
				
				key_p_wp1		= !key_wp1 && ((c & (1 << 9)) > 0);
				key_wp1			= (c & (1 << 9)) > 0;	
				
				key_p_wp2		= !key_wp2 && ((c & (1 << 10)) > 0);
				key_wp2			= (c & (1 << 10)) > 0;	
				
				key_p_start		= !key_start && ((c & (1 << 11)) > 0);
				key_start		= (c & (1 << 11)) > 0;	
			}
		} else {
			global.running_replay = false;
		}
	}
}
/// @description Replay stop
function replay_stop() {
	if (global.recording_replay) {
		global.recording_replay = false;
		file_bin_close(global.replay_file);
	} else {
		global.running_replay = false;	
	}
}