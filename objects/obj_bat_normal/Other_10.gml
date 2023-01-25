enum bat { hanging, attacking, retreating}
#region States
var t = state_timer++;
var target = nearest_player;
var distance_x = abs(pl_x - x);
switch(state) {
	#region Hanging
	case bat.hanging:
		animation_play("H");
	    if (distance_x < 150 || !is_on_ceil())
			// Wait 1 second if it's sleeping
			if (!substates[0] || t > 60)
		        state_set(bat.attacking);
		break;
	#endregion
	#region Attacking
	case bat.attacking:
		animation_play("A");
		move_to_point(pl_x, pl_y, fly_speed);
	    smoke = true;
		// Retreat if the target has been hit
		if (player_got_hurt) {
			player_got_hurt = false;
			state_set(bat.retreating);
		}
		break;
	#endregion
	#region Retreating
	case bat.retreating:
		smoke = false;
		v_speed = -2.5;
		through_walls = true;
		// Go up until it's on ceil
		if (is_on_ceil(v_speed) && is_place_free(x, y)) {
			move_contact_block(0, v_speed);
			state_set(bat.hanging, 0, [true]); // Sleep
			v_speed = 0;
			through_walls = false;
		}
		break;
	#endregion
}
#endregion