function scr_weapon_collision() {
#region Melee Timer
	if (melee_counter >= 0)
	    melee_counter --;
#endregion
#region Slow Down - Hitstun
	if (melee_counter)
		room_speed = 9;
	else
		room_speed = 60;
#endregion
#region Collision with Enemy
	var parents = [par_destructibleobject, par_enemy];
	// Remember to destroy or block this weapon after all collisions are processed
	var to_destroy = false, to_block = false;
	// Play hit sound
	var play_hit = false;
	var _hit_sound = hit_sound;
	// Update Melee Counter (slow down)
	var set_melee_counter = -1;
	// If this weapon isn't being destroyed
	if (!destroy) {
		// For each parent
		for (var k = 0; k < array_length(parents); k++) {
			// List of enemies/blocks in contact with this weapon
			var enemies_list = ds_list_create();
			var parent = parents[k];
			// List Size
			var n = instance_place_list(x, y, parent, enemies_list, false);
			// For each enemy
			for (var i = 0; i < n; i++) {
				var enemy = enemies_list[| i];
				var enemy_block = false;
				// Ignore this enemy if it's dead or undamageable
				if (enemy.dead || !enemy.damageable) continue;
				set_melee_counter = 2;
				// If the enemy can block this weapon
				if (enemy.blocking) {
					to_destroy = true;
					to_block = true;
					enemy_block = true;
				} else {
					var enemy_hp = enemy.hp;
					var can_hit_boss = (enemy.is_boss && (enemy.boss_buffer <= 0 || shot_level > enemy.boss_buffer_level - hit_if_shot_level_is_equal))
					if (!enemy.is_boss || can_hit_boss) {
						var dmg = atk;
						if (enemy.is_boss) {
							dmg = boss_damage[? noone];
							if (ds_map_exists(boss_damage, enemy.object_index))
								dmg = boss_damage[? enemy.object_index];
						}
						scr_weapon_apply_damage(enemy, dmg);
						if (enemy.hp > 0 || hit_sound_on_destroy || (enemy.is_boss && enemy.state != boss_states.death))
							play_hit = true;
					}
					// It's a boss and can't hit
					else if (weapon_type == weapon_types.saber) {
						enemy_block = true;
						to_block = true;
					} else {
						to_destroy = true;	
						play_hit = true;
						enemy.light++;
					}
					switch (parent) {
						case par_destructibleobject:
							// Do something
							break;
						case par_enemy:
							if (can_hit_boss) {
								enemy.boss_buffer = boss_buffer_limit;
								enemy.boss_buffer_level = shot_level;
								_hit_sound = snd_boss_hit;
							}
							break;
						case par_enemy_projectile:
							// Destroy projectile?
							break;
					}
					if (((atk == enemy_hp && destroy_if_equal_to_atk) || (destroy_if_hit && !enemy.is_boss)) || enemy.hp > 0)
						to_destroy = true;
					if (enemy.is_boss && enemy.hp <= 0 && enemy.state != boss_states.death) {	
						with (enemy) {
							state_set(boss_states.death);
							light = 0;
							boss_buffer = 0;
							if (other.weapon_death_type == weapon_death_types.saber)
								death_animation = "death_chop";
						}
						with (obj_player_shot_parent) {
							can_hit = false;
							if (timer < other.timer) {
								event_perform(ev_step, ev_step_normal);
							}
						}
						pause_set(true, pause_types.boss_death);
						with (obj_player_parent) {
							immortal = true;	
						}
						music_stop();
						audio_pause_all();
					}
				}
				// Create Saber Hitspark effect for this enemy
				if (weapon_type == weapon_types.saber && (enemy_block || owner.saber_slash))
					scr_saber_create_hitspark(enemy, enemy_block);
				// Run custom collision script (Ex: plasma ball, ...)
				on_collision(enemy);
			}
			ds_list_destroy(enemies_list);
		}
	}
	if (melee_activated && set_melee_counter > -1) {
		destroy = false;
		to_destroy = true;
		melee_counter = set_melee_counter;
	}

	if (to_block) {
		audio_play(block_sound);
		if (weapon_type != weapon_types.saber)
			blocked = true;
	}

	if (!destroy) {
		if (to_destroy) {
			destroy = true;
			event_perform(ev_step, ev_step_normal);
		}
		if (play_hit) {
			if (hit_cancel_sound) {
				audio_stop(_hit_sound);
			}
			audio_play(_hit_sound);
			if (hit_only_once) {
				hit_sound = noone;	
			}
		}
	}
#endregion


}
