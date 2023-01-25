// Warning: this script is very similar to enemy_init and needs refactoring
function projectile_collision_init() {
	on_a_slope=0;
	grv_speed_up= 0.25;
	grv_speed_down = 0.25;
	max_jmp_speed=6;
	in_air=true;
	hspd=0;
	sub_pixel_h=0;
	vspd=0;
	sub_pixel_v=0;
	hit = 0;
	xscale = 1;
	yscale = 1;
	max_slope=3;

	moved = 0;

	nearest_player = 0;
	_p =0;

	door_immunity = 0;

	hp = 1;
	max_hp = 1;

	collide_damage = 1; //how much damage the enemy does on contact
	blocking=false; //nullify damage
	damageable = false;

	grab_player = false; // Can grab the player
	grabbing_player = false; // Is grabbing the player
	grab_player_inst = noone; // Grabbed player

	frozen = 0; // should the boss stop
	lv=0; // level of the enemy
	class = 0;  //0 - small enemies. one explosion. 1 - bigger enemies. explosion pattern
	light=0;  //used for hit effect
	face_x = 0; // do we face the player?
	grav = 0; //do we have gravity?
	item = 0; //do we drop items?
	persist = 0; //do we die offscreen?
	through_walls = true; //do we go through walls?
	is_projectile = 1; //are we a projectile and not an enemy?

	is_player = false;
	is_boss = 0; // duh
	player_got_hurt = false;
	boss_buffer = 0;
	boss_buffer_level = 0;
	dead = false;
	death_type = death_types.normal;

	image_speed = 0;
	enum phy_types {
		OLD, NEW	
	}
	smoke_init();
	phy_type = phy_types.OLD;
	scr_physics_init(0.25, 0, 0);
	animations_init();
	animation_init();
	if (is_projectile){in_air = true;}//projectile types explode when not in the air. So this corrects sthat 

	normal_color = c_white;
	normal_alpha = 1;
	fade_color = c_black;
	fade_alpha = 0;
	y_start = y;
	x_start = x;
	draw_on_surface = false;
	ignore_draw = false;
	trail_init(0);
	timer = 0;
	
	hitbox_sprite = mask_index;
	colbox_sprite = sprite_index;

	local_game_speed_init();

}
