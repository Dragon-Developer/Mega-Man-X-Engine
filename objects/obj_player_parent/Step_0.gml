player_step();
script_execute(animation_controller);
if (!global.paused && !locked) {
	player_saber_after_step();
}
if (!global.paused) {	
	scr_physics_update(false);
}

G.player_x = x;
G.player_y = y;
