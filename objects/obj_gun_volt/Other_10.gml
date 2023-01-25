enum gun_volt {stand, open, attack, close};
#region States
var t = state_timer++;
switch(state) {
	#region Stand
	case gun_volt.stand:
		animation_play("S");
		if (t >= 66)
			state_set(gun_volt.open);
		break;
	#endregion
	#region Open
	case gun_volt.open:
		if (t == 0)
			animation_play("O");
		if (animation_end) {
			animation_play("A");
			state_set(gun_volt.attack);
			substates[0] = choose(0, 1);
		}
		break;
	#endregion
	#region Attack
	case gun_volt.attack:
		var type = substates[0];
		// Missiles
		if (t == 24) {
			if (type == 0) {
				var x_offsets = [29, 13];
				var y_offsets = [9, 9];
				var n = substates[1];
				var shot = instance_create_depth(x + x_offsets[n] * dir, y + y_offsets[n], depth - 1, obj_gun_volt_missile);
		        shot.dir = dir;
				shot.h_speed = shot.abs_hspeed * dir;
		        shot.xscale = xscale;
			}
			// Spark
			else {
				var x_offsets = [13, -4];
				for (var i = 0; i < 2; i++) {
					var shot = instance_create_depth(x + x_offsets[i] * dir, y + 8, depth - 1, obj_gun_volt_spark);
		            shot.dir = dir;
		            shot.xscale = xscale;
		            audio_play(snd_thunder);
				}
			}
		}
		// Close
		if (animation_end) {
			// Ignore invalid types
			if (type == 0 || type == 1) {
				if (++substates[1] < atk_limit[type]) {
					state_set(gun_volt.attack);
					animation_play("A", 0);
				} else {
					animation_play("C");
					state_set(gun_volt.close);
					substates[1] = 0;
				}
			}
		}
		break;
	#endregion
	#region Close
	case gun_volt.close:
		if (animation_end) {
			animation_play("S");
			state_set(gun_volt.stand);
		}
		break;
	#endregion
}
#endregion