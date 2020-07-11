if (!shoot_unlocked) exit;

current_weapon = weapon[0];

var condition = true;

special_input_update();

for (var i = 0; i < ds_list_size(special_weapons); i++)
{
	var scr = special_weapons[| i];
	
	if (script_exists(scr))
	{
		script_execute(scr);
	}
}

if (!charge_enabled)
{
	charge = false;
	charge_t = 0;
	
}
if (dash_up || dolor || !shoot_enabled || shoot_wait) condition = false;

var change_state = -1, change_state_type = shoot_types.normal;;

if (current_weapon != noone && condition)
{
	if (key_p_shoot || (!key_shoot && charge))
	{	
		
		charge = false;
		charge_t = 0;
		
		if (shots_count < shots_limit)
		{
			shoot_t = 0;
			weapon_script = weapons_script[current_weapon];
		
			if (charge_level < 0)
			{	
				charge_level = 0;
			}
		
			player_shoot(charge_level, shot_id);
			audio_stop(charge_sound);
		}
	}
}

if (!shoot)
{
	if (key_shoot && !charge && charge_level <= 0)
	{
		charge = true;
		charge_t = 0;
	}	
}
else
{
	var t = shoot_t++;

	if (t == 0 && shoot_animation == "" && shoot_next_animation != "")
	{
		shoot_animation = shoot_next_animation;
		shoot_projectile = shoot_next_projectile;
		shoot_type = shoot_next_type;
		shoot_wait = shoot_next_wait;
		shoot_next_animation = "";
	}
	
	if (shoot_animation != "")
	{
		animation = "";
		animation_play(shoot_animation, t);
		
		change_state = true;
		change_state_type = shoot_type;
		
		if (t == shoot_at_time)
		{
			if (shoot_projectile != noone) player_shoot_projectile(shoot_projectile);
			shoot_projectile = noone;
		}
	}
	else
	{
		if (array_contains(["idle", "shoot"], animation))
		{
			if (t == 0) animation = "";
			animation_play("shoot", t);
		}
	}
	
	if (t > shoot_limit)
	{
		if (shoot_next_animation != "")
		{
			shoot_animation = shoot_next_animation;
			shoot_type = shoot_next_type;
			change_state = true;
			change_state_type = shoot_type;
			shoot_projectile = shoot_next_projectile;
			shoot_wait = shoot_next_wait;
			shoot_next_animation = "";
		}
		else
		{
			shoot = false;
			change_state = false;
			change_state_type = shoot_type;
			shoot_animation = "";
			shoot_wait = false;
			shoot_next_wait = false;
			shoot_next_animation = "";
			shoot_type = shoot_types.normal;
			player_idle();
		}
		
		shoot_t = 0;
	}
}

if (change_state > -1)
{
	switch(change_state_type)
	{
		case shoot_types.special_floor_and_air:
			var iof = is_on_floor();
			if ((wall_slide || wall_jump))
			{
				if (shoot_projectile != noone)
				{
					player_shoot_projectile(shoot_projectile);
					shoot_projectile = noone;
				}
				shoot_animation = "";
				shoot_limit = 16;
				shoot_wait = false;
				change_state = false;	
			}
			
			dash = false;
			dash_enabled = !change_state;
			idle_enabled = !change_state;
			jump_animation_enabled = !change_state;
			fall_enabled = !change_state;
			walk_enabled = !iof || !change_state;
			walk_ignore_dir = iof && change_state;
			walk_ignore_move = iof && change_state;
			
			if (!change_state)
			{
				wall_slide_enabled = true;
				wall_jump_enabled = true;
			}
			
			if (change_state && !iof && shoot_animation != "")
			{
				animation = "";
				animation_play(shoot_animation + "_air", shoot_t - 1);
			}
		break;
	}
}

player_charge();
