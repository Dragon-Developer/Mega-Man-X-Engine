player_step();
script_execute(animation_controller);
if (!global.paused && !locked) {
	player_saber_after_step();
}
if (!global.paused) {	
	scr_physics_update(false);
}

if(armor_check)
{
 player_check_armor();
 armor_check = 0;
}

G.player_x = x;
G.player_y = y;
