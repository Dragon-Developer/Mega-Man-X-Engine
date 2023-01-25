function player_check_dolor() {
	var previous_mask = mask_index;
	mask_index = state_hitbox[state];
	if (state_hitbox_current != noone) {
		mask_index = state_hitbox_current;
		state_hitbox_current = noone;
	}
	var enemy = instance_place(x, y, par_enemy);
	mask_index = previous_mask;
	if (state == states.death || state == states.grabbed || weapon_demo) exit;
	if (!immortal) {
		if (!immunity && state != states.dolor && instance_exists(enemy) && !enemy.dead && enemy.collide_damage > 0) {
			var _damage_reduction = damage_reduction;
			if (enemy.grab_player) {
				enemy.grabbing_player = true;
				enemy.grab_player_inst = id;
				enemy.grab_player = false;
				// Grabbed state
				state_set(states.grabbed, 0, [0, 0, 0, 0, 0]);
			} else {
		
				if (instance_exists(defense_shield_inst)) {
					_damage_reduction = defense_shield_damage_reduction;
					defense_shield_inst = player_effect_destroy(defense_shield_inst);
					defense_shield_enabled = false;
				}
				dolor_damage = max(1, floor(enemy.collide_damage * (1 - _damage_reduction)));
				var new_health = hp - dolor_damage;
				enemy.player_got_hurt = true;
				player_state_set(states.dolor, 0, [new_health > 0 && state == states.wall_slide, 0, 0, 0, 0]);
				player_weapon_refill(true);
			}
		}
		if (state != states.dolor) {
			var dx = x - x_previous, dy = y - y_previous;
			if (dy == 0)
				dy = 1;
			if (death_by_spike) {
				if (spikes_meeting(x + dx, ceil(y + dy)) || (is_on_floor() && spikes_meeting(x + dx, ceil(y)))) {
					hp = 0;	
				}
			}
			if (!is_inside_view() ) {
				if (state != states.death && (y >= limit_y_death)) {
					hp = 0;
					y = limit_y_death + 200;
				}
			}
		}
		/*if (keyboard_check(ord("0")))
			hp = 0;*/
		if (hp <= 0 && state != states.death) {
			player_state_set(states.death, 0);
			with (par_boss) {
				damageable = false;	
			}
			audio_stop(land_sound);
			dead = true;
			exit;
		}
	}
	// Update critical status
	var new_critical = (hp <= critical_health * max_hp);
	if (critical != new_critical) {
		critical = new_critical;	
	}


}
