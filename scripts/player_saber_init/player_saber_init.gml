// Refactoring it to use structs would be good, but it might need a lot of changes in other scripts
function player_saber_init() {
	enum saber_atks
	{
		atk1, atk2, atk3,
		jump, wall, 
		normal_length,
		up, spinning_jump, down, dash,
		raikousen,
		charged_saber, genmu,
		length
	}

	saber = instance_create_depth(x, y, depth - 10, obj_saber);
	saber.owner = id;
	saber_state = noone;
	saber_atk_animation = "";
	saber_end_animation = "";
	saber_atk_next = false;
	saber_unlocked = false;
	saber_enabled = false;
	saber_atk = noone;
	saber_atk_current = noone;
	saber_atk_hspeed = 0;
	saber_projectile_frame = 0;

	saber_key = 1;
	saber_key_h = false;
	saber_key_p = false;

	// Init
	for (var i = 0; i < saber_atks.length; i++) {
		saber_states[i] = noone;
		saber_atk_animations[i] = "";
		saber_atk_sounds[i] = noone;
		saber_atk_unlocked[i] = false;
		saber_mask[i] = noone;
		saber_sprites[i] = noone;
		saber_hitstun_interval[i] = [0, 0, 0];
		saber_damage[i] = 1;
		saber_effects[i] = 0;
		saber_atk_skill[i] = saber_skills.normal;
		saber_projectile_frames[i] = 0;
	}
	// States
	saber_states[saber_atks.atk1]           = states.saber_atk1;
	saber_states[saber_atks.atk2]           = states.saber_atk2;
	saber_states[saber_atks.atk3]           = states.saber_atk3;
	saber_states[saber_atks.jump]           = states.saber_jump;
	saber_states[saber_atks.wall]           = states.saber_wall;
	saber_states[saber_atks.spinning_jump]  = states.saber_spinning_jump;
	saber_states[saber_atks.up]             = states.saber_up;
	saber_states[saber_atks.down]           = states.saber_down;
	saber_states[saber_atks.dash]           = states.saber_dash;
	saber_states[saber_atks.raikousen]      = states.saber_raikousen;
	saber_states[saber_atks.charged_saber]  = states.saber_atk3;
	saber_states[saber_atks.genmu]			= states.saber_atk3;

	// Animations
	saber_atk_animations[saber_atks.atk1]          = "atk_1";
	saber_atk_animations[saber_atks.atk2]          = "atk_2";
	saber_atk_animations[saber_atks.atk3]          = "atk_3";
	saber_atk_animations[saber_atks.jump]          = "atk_jump";
	saber_atk_animations[saber_atks.wall]          = "atk_wall";
	saber_atk_animations[saber_atks.spinning_jump] = "atk_mikazukizan";
	saber_atk_animations[saber_atks.up]            = "atk_ryuenjin";
	saber_atk_animations[saber_atks.down]          = "atk_hyouretsuzan";
	saber_atk_animations[saber_atks.dash]          = "atk_shippuuga";
	saber_atk_animations[saber_atks.raikousen]     = "atk_raikousen";
	saber_atk_animations[saber_atks.charged_saber] = "atk_3";

	// Sounds
	saber_atk_sounds[saber_atks.atk1]           = snd_player_zero_saber_1;
	saber_atk_sounds[saber_atks.atk2]           = snd_player_zero_saber_1;
	saber_atk_sounds[saber_atks.atk3]           = snd_player_zero_saber_2;
	saber_atk_sounds[saber_atks.jump]           = snd_player_zero_saber_1;
	saber_atk_sounds[saber_atks.wall]           = snd_player_zero_saber_1;
	saber_atk_sounds[saber_atks.spinning_jump]  = snd_player_zero_saber_2;
	saber_atk_sounds[saber_atks.up]             = snd_player_zero_saber_ryuenjin;
	saber_atk_sounds[saber_atks.down]           = snd_player_zero_saber_hyouretsuzan;
	saber_atk_sounds[saber_atks.dash]           = snd_player_zero_saber_1;
	saber_atk_sounds[saber_atks.raikousen]      = noone;
	saber_atk_sounds[saber_atks.charged_saber]  = snd_player_zero_saber_2;
	saber_atk_sounds[saber_atks.genmu]          = snd_player_zero_saber_2;

	// Mask
	saber_mask[saber_atks.up]				   = spr_zero_saber_ryuenjin_mask;
	saber_mask[saber_atks.raikousen]           = spr_zero_saber_raikousen_mask;

	// Unlocked
	saber_atk_unlocked[saber_atks.atk1]          = true;
	saber_atk_unlocked[saber_atks.atk2]          = true;
	saber_atk_unlocked[saber_atks.atk3]          = true;
	saber_atk_unlocked[saber_atks.jump]          = true;
	saber_atk_unlocked[saber_atks.wall]          = true;
	saber_atk_unlocked[saber_atks.spinning_jump] = false;
	saber_atk_unlocked[saber_atks.up]            = false;
	saber_atk_unlocked[saber_atks.down]          = false;
	saber_atk_unlocked[saber_atks.dash]          = false;
	saber_atk_unlocked[saber_atks.raikousen]     = false;

	// Projectile
	saber_projectile_frames[saber_atks.atk3] = 4;
	saber_projectile_frames[saber_atks.charged_saber] = 4;

	// Saber Hitstun Interval + Hit Times
	saber_hitstun_interval[saber_atks.atk1]          = [0, 6, 1];
	saber_hitstun_interval[saber_atks.atk2]          = [2, 6, 1];
	saber_hitstun_interval[saber_atks.atk3]          = [0, 8, 6];
	saber_hitstun_interval[saber_atks.jump]          = [1, 8, 2];
	saber_hitstun_interval[saber_atks.wall]          = [3, 8, 2];
	saber_hitstun_interval[saber_atks.spinning_jump] = [1, 8, 6];
	saber_hitstun_interval[saber_atks.up]            = [4, 30, 6];
	saber_hitstun_interval[saber_atks.down]          = [4, infinity, 6];
	saber_hitstun_interval[saber_atks.dash]          = [2, 10, 6];
	saber_hitstun_interval[saber_atks.raikousen]     = [12, 32, 6];
	saber_hitstun_interval[saber_atks.charged_saber] = [0, 8, 6];
	saber_hitstun_interval[saber_atks.genmu]		 = [0, 8, 6];

	// Damage
	saber_damage[saber_atks.atk1]          = 2;
	saber_damage[saber_atks.atk2]          = 2;
	saber_damage[saber_atks.atk3]          = 1;
	saber_damage[saber_atks.jump]          = 2;
	saber_damage[saber_atks.wall]          = 2;
	saber_damage[saber_atks.spinning_jump] = 3;
	saber_damage[saber_atks.up]            = 1;
	saber_damage[saber_atks.down]          = 2;
	saber_damage[saber_atks.dash]          = 2;
	saber_damage[saber_atks.raikousen]     = 2;
	saber_damage[saber_atks.charged_saber] = 3;
	saber_damage[saber_atks.genmu]		   = 4;

	// Slash Effect Sprites
	saber_slash_sprites[0] = spr_saber_d_effect;
	saber_slash_sprites[1] = spr_saber_h_effect;
	saber_slash_sprites[2] = spr_saber_block_effect;
	saber_slash_sprite     = spr_saber_d_effect;
	saber_slash = true;

	// Slash Effect (0 = Diagonal, 1 = Horizontal)
	saber_effects[saber_atks.atk1]          = 0;
	saber_effects[saber_atks.atk2]          = 1;
	saber_effects[saber_atks.atk3]          = 0;
	saber_effects[saber_atks.jump]          = 0;
	saber_effects[saber_atks.wall]          = 0;
	saber_effects[saber_atks.spinning_jump] = 0;
	saber_effects[saber_atks.up]            = 0;
	saber_effects[saber_atks.down]          = 0;
	saber_effects[saber_atks.dash]          = 1;
	saber_effects[saber_atks.raikousen]     = 1;
	saber_effects[saber_atks.charged_saber] = 0;
	saber_effects[saber_atks.genmu]			= 0;

	// Saber Skill (for Boss Damage)
	saber_atk_skill[saber_atks.atk3]		  = saber_skills.atk3;
	saber_atk_skill[saber_atks.up]			  = saber_skills.ryuenjin;
	saber_atk_skill[saber_atks.spinning_jump] = saber_skills.mikazukizan;
	saber_atk_skill[saber_atks.raikousen]	  = saber_skills.raikousen;
	saber_atk_skill[saber_atks.charged_saber] = saber_skills.charged_saber;
	saber_atk_skill[saber_atks.genmu]		  = saber_skills.genmu;
	saber_atk_sound = noone;

	player_saber_skills_init();
	player_saber_sprites();


}
