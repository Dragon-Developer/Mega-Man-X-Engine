function player_states() {
	enum states
	{
		none,
		ready,
		intro,
		capsule,
		outro,
		idle,
		crouch,
		walk,
		dash,
		jump,
		fall,
		land,
		dead,
		damaged,
		wall_jump,
		wall_slide,
		dolor,
		death,
		complete,
		grabbed,
		ride,
		length_default,
		// Special
		high_jump,
		hover,
		ceil_cling,
		glide,
		fly,
		dodge_roll,
		// Special Attacks
		hadouken,
		shoryuken,
		tatsumaki,
		nova_strike,
		giga_falcon,
		shin_messenko,
		messenko,
		speed_gear,
		dive_kick,
		z_buster_x5,
		// Weapons
		db_buster,
		x3_saber,
		z_saber,
		shoot_pistol,
		open_arms,
		screen_cleaner,
		giga_crush,
		// Saber
		saber_atk1,
		saber_atk2,
		saber_atk3,
		saber_jump,
		saber_wall,
		saber_spinning_jump,
		saber_up,
		saber_down,
		saber_dash,
		saber_raikousen,
		length_all
	}

	for (var i = states.length_all - 1; i >= 0; i--) {
		state_unlocked[i] = (i < states.length_default);
		state_enabled[i] = (i < states.length_default);
		state_hitbox[i] = mask_index;
		animation_enabled[i] = true;
	}

	state_machine_init();
	state = states.ready;

	// State Scripts
	state_array[states.none]         = noone;
	state_array[states.ready]        = player_state_ready;
	state_array[states.intro]        = player_state_intro;
	state_array[states.capsule]      = player_state_armor_change;
	state_array[states.outro]		 = player_state_outro;
	state_array[states.idle]         = player_state_idle;
	state_array[states.crouch]       = player_state_crouch;
	state_array[states.walk]         = player_state_walk;
	state_array[states.jump]         = player_state_jump;
	state_array[states.fall]         = player_state_fall;
	state_array[states.land]         = player_state_land;
	state_array[states.dash]         = player_state_dash;
	state_array[states.wall_slide]   = player_state_wall_slide;
	state_array[states.wall_jump]    = player_state_wall_jump;
	state_array[states.dolor]        = player_state_dolor;
	state_array[states.death]        = player_state_death;
	state_array[states.complete]	 = player_state_complete;
	state_array[states.grabbed]	     = player_state_grabbed;
	state_array[states.ride]	     = player_state_ride;
	

	// Special State Scripts
	state_array[states.hover]        = player_state_hover;
	state_array[states.ceil_cling]   = player_state_ceil_cling;
	state_array[states.glide]        = player_state_glide;
	state_array[states.fly]          = player_state_fly;
	state_array[states.dodge_roll]   = player_state_dodge_roll;

	// Special Attack States
	state_array[states.nova_strike]		= player_state_nova_strike;
	state_array[states.hadouken]		= player_state_hadouken;
	state_array[states.shoryuken]		= player_state_shoryuken;
	state_array[states.tatsumaki]		= player_state_tatsumaki;
	state_array[states.giga_falcon]		= player_state_giga_falcon;
	state_array[states.messenko]		= player_state_messenko;
	state_array[states.shin_messenko]	= player_state_shin_messenko;
	state_array[states.dive_kick]		= player_state_dive_kick;
	state_array[states.z_buster_x5]		= player_state_z_buster_x5;

	// Weapons
	state_array[states.db_buster]		= player_state_db_buster;
	state_array[states.x3_saber]		= player_state_x3_saber;
	state_array[states.shoot_pistol]    = player_state_shoot_pistol;
	state_array[states.open_arms]       = player_state_open_arms;
	state_array[states.screen_cleaner]  = player_state_screen_cleaner;
	state_array[states.giga_crush]	    = player_state_giga_crush;

	// Saber
	state_array[states.saber_atk1]			  = player_state_saber_normal;
	state_array[states.saber_atk2]			  = player_state_saber_normal;
	state_array[states.saber_atk3]			  = player_state_saber_normal;
	state_array[states.saber_jump]			  = player_state_saber_jump;
	state_array[states.saber_wall]			  = player_state_saber_wall;
	state_array[states.saber_spinning_jump]   = player_state_saber_spinning_jump;
	state_array[states.saber_up]              = player_state_saber_up;
	state_array[states.saber_down]            = player_state_saber_down;
	state_array[states.saber_dash]            = player_state_saber_dash;
	state_array[states.saber_raikousen]       = player_state_saber_raikousen;

}
