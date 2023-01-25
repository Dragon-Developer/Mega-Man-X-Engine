// Warning: this script is very similar to projectile_collision_init and needs refactoring
function enemy_init() {
	on_a_slope = 0;
	grv_speed_up = 0.25;
	grv_speed_down = 0.25;
	max_jmp_speed = 6;
	in_air = false;
	hspd = 0;
	sub_pixel_h = 0;
	vspd = 0;
	sub_pixel_v = 0;
	hit = 0;
	max_slope = 3;
	moved = 0;

	nearest_player = 0;
	_p = 0;
	door_immunity = 0;
	pl_x = 0;
	pl_y = 0;

	hp = 1;
	max_hp = 1;
	max_bar_hp = 32;

	collide_damage = 1; // How much damage the enemy does on contact
	blocking = false; // Nullify damage
	damageable = true;
	grab_player = false; // Can grab the player
	grabbing_player = false; // Is grabbing the player
	grab_player_inst = noone; // Grabbed player

	intro = false; // Avoid exploding if the boss has 0 HP but is still intro
	frozen = 0; // Should the boss stop
	lv = 0; // Level of the enemy
	class = 0;  // 0 - small enemies. one explosion. 1 - bigger enemies. explosion pattern
	death_type = death_types.normal;
	light = 0;  // Used for hit effect
	face_x = 1; // Do we face the player?
	xscale = 1; // Direction we face
	dir = xscale;
	inside_view = true;
	if (instance_exists(obj_player_parent)) {
		nearest_player = instance_nearest(x, y, obj_player_parent);
		pl_x = nearest_player.x;
		pl_y = nearest_player.y;
		if (pl_x < x) dir = -1;
		else dir = 1;
	}
	//grav = 1; // Do we have gravity?
	scr_physics_init(0.25, 0, 0);
	water_physics_enabled = true;
	item = 1; // Do we drop items?
	persist = 0; // Do we die offscreen?
	through_walls = 0; // Do we go through walls?
	is_projectile = 0; // Are we a projectile and not an enemy?
	dead = false;

	is_player = false;
	player_got_hurt = false;
	is_boss = 0;
	boss_buffer = 0;
	boss_buffer_t = 0;
	boss_buffer_level = 0;

	phy_type = phy_types.OLD;
	smoke_init();
	state_set(0, 0, [0, 0, 0, 0, 0]);
	animation_init();
	animations_init();

	normal_color = c_white;
	normal_alpha = 1;
	fade_color = c_black;
	fade_alpha = 0;
	draw_x = x;
	draw_y = y;
	y_start = y;
	x_start = x;

	surface_draw_init();
	trail_init(0);

	hitbox_sprite = mask_index;
	colbox_sprite = sprite_index;

	local_game_speed_init();
}
