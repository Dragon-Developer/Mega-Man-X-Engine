/// @description  Update camera position

PAUSE_ONLY_NORMAL;
var _x = x, _y = y;
visible = global.debug_active;
var min_x = global.camera_min_x;
var max_x = global.camera_max_x;
var min_y = global.camera_min_y;
var max_y = global.camera_max_y;
var vh = global.view_height;
// Camera Shake
var shake_y = 0;
if (global.camera_shake) {
	if (!global.paused) {
		shake_t++;
		if (shake_t mod 3 == 0)
			shake_y = 1;
		else if (shake_t mod 3 == 1)
			shake_y = -1;
	} else {
		shake_y = 0;	
	}
} else {
	shake_t = 0;	
}

var is_dead = instance_exists(obj_player_parent) && obj_player_parent.state == states.death;
if (!instance_exists(obj_player_parent) || instance_exists(obj_player_ready) || is_dead) {
	if (!global.checkpoint && !is_dead) {
		__view_set(e__VW.XView, view_id, min_x);
		__view_set(e__VW.YView, view_id, min_y);
	}
	event_user(0);
	exit;
}


if (instance_exists(obj_player_parent))
    ground_mode = obj_player_parent.in_air;
x = floor(global.player_x);
y = floor(global.player_y);

// I don't know who wrote this part of the code and I don't understand it well.
// If you have any doubt, ask ApselTheBlue.
// Needs refactoring

var ox, oy, view_yspeed, view_xspeed;

// Define center offset

ox = ceil(x-(__view_get( e__VW.XView, view_id ) + __view_get( e__VW.WView, view_id )/2));
oy = ceil(y-(__view_get( e__VW.YView, view_id ) + vh/2));

// Define borders
if (ground_mode) {
    if (oy > global.camera_vbor_max_y)
        oy -= global.camera_vbor_max_y;
	else if (oy < global.camera_vbor_min_y)
		oy -= global.camera_vbor_min_y;
    else 
        oy = 0;
}
ox = max(ox, min_x - (__view_get( e__VW.XView, view_id )));
ox = min(ox, max_x - (__view_get( e__VW.XView, view_id )+__view_get( e__VW.WView, view_id )));
oy = max(oy, min_y - (__view_get( e__VW.YView, view_id )));
oy = min(oy, max_y - (__view_get( e__VW.YView, view_id )+__view_get( e__VW.HView, view_id )));
// limit speed
var dx = abs(x - _x), dy = abs(y - _y);
door = global.pause_type == pause_types.door;
if (!door) {
	if (global.player_spawned) {
		view_xspeed = max(dx, 5);
		view_yspeed = max(dy, 3);
	} else {
		view_xspeed = max(dx, 320/116);
		view_yspeed = max(dy, 240/101);
	}
} else {
	view_xspeed = max(dx, 3);
	view_yspeed = max(dy, 240/101);
}
if (abs(ox) > view_xspeed)
    ox = view_xspeed*sign(ox)
if (abs(oy)>  view_yspeed) 
    oy = view_yspeed*sign(oy);

oy += shake_y;
// move view
if (ox < 0 && __view_get( e__VW.XView, view_id ) >= min_x) 
    __view_set( e__VW.XView, view_id, max(floor(__view_get( e__VW.XView, view_id ) + ox), min_x ));
if (ox > 0 && (__view_get( e__VW.XView, view_id ) + __view_get( e__VW.WView, view_id )) <= max_x) 
    __view_set( e__VW.XView, view_id, min(floor(__view_get( e__VW.XView, view_id ) + ox), max_x-__view_get( e__VW.WView, view_id ) ));
    
if (oy < 0 && __view_get( e__VW.YView, view_id ) >= min_y) 
    __view_set( e__VW.YView, view_id, max(__view_get( e__VW.YView, view_id ) + oy, shake_y + min_y ));
if (oy > 0 && (__view_get( e__VW.YView, view_id )+__view_get( e__VW.HView, view_id )) <= max_y)
    __view_set( e__VW.YView, view_id, min(__view_get( e__VW.YView, view_id ) + oy, shake_y + max_y-__view_get( e__VW.HView, view_id ) ));

// Checkpoint
if (global.reload && global.checkpoint) {
    x = (global.checkpoint_x);
    y = (global.checkpoint_y - 75);
    
    global.current_camera = global.checkpoint_camera;
}

if (global.reload && !global.checkpoint) {
	x = (global.player_x);
    y = (global.player_y);   
}

mid_x = __view_get(e__VW.XView, 0) + _width / 2;
mid_y = __view_get(e__VW.YView, 0) + _height / 2;

event_user(0);