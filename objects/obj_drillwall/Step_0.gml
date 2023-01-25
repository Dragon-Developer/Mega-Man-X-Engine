PAUSE;
event_inherited();
if (!local_game_run_step) exit;
#region Enum
enum drill {
	start, wait, drill_up, drilling, fall, dead, done
}
#endregion
#region Macros
#macro drill_x params[0]
#macro drill_y params[1]
#macro drill_count params[2]
#macro pipe_x params[3]
#macro pipe_y params[4]
#endregion
#region States

if (dead) exit;
var i;
switch(state) {
	#region Start
	case drill.start:
		if (drill_count < 6) {
	        drill_count += 1;
	        drill_y -= 1;
	    } else {
	        state_set(drill.drill_up);
	        audio_play(snd_drill_launch);
	        s = instance_create_depth(x + 2, y, depth - 1, obj_drillwall_smoke);
	        s.h_speed = 1;
	        s = instance_create_depth(x - 4, y, depth - 1, obj_drillwall_smoke);
	        s.h_speed = -1;
	        s.image_xscale = -1;
	    }
		break;
	#endregion
	#region Wait
	case drill.wait:
		state_set(drill.start);
		break;
	#endregion
	#region Drill Up
	case drill.drill_up:
	    for (i = -1; i > -3; i -= 1) {
	        if (bbox_bottom <= pipe_y) {
	            pipe_y -= 2;
				pipe.image_yscale -= 1;
	        }
	    }
	    if (!collision_point(x, bbox_top, obj_square_parent, false, true)) {
	        y -= 3;
	    } else {
	        y = yprevious;
			pipe.image_yscale -= 3;
	        if (bbox_bottom % 2 == 0) {
				pipe.image_yscale -= 1;
			}
	        drill_y = y;
	        drill_count = 0;
	        state_set(drill.drilling);
			pipe.image_yscale = 4 * round(pipe.image_yscale / 4);
	    }
		image_index = drill_count;
		break;
	#endregion
	#region Drilling
	case drill.drilling:
		if (drill_count < 60) {
	        if (!audio_is_playing(snd_drillwall))
				audio_play(snd_drillwall);
	        if (drill_count % 2 == 1) {
	            if (y == drill_y)
	                y += 1;
	            else if (y == drill_y + 1)
					y -= 1;
	        }
	        drill_count ++;
	    } else state_set(drill.fall);
		image_index = drill_count;
		break;
	#endregion
	#region Fall
	case drill.fall:
		sprite_index = spr_drillwall_head_spin;
		image_index += 0.25;
		var _y = base_y - 3;
	    if (y < _y)
			y += 0.5;
	    else
			y = _y;
		if (y == _y) {
		    sprite_index = spr_drillwall_head;
		    state_set(drill.done);
		}
		break;
	#endregion
}
trail_pos[2] = [drill_x, drill_y, true];
#endregion