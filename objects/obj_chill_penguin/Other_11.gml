enum chill_penguin {
	jump_to_hook,
	jump_desperate,
	fall_desperate,
	throw_ice,
	grab_hook
}
switch(state) {
	#region Jump and Shoot at the wall
	case chill_penguin.jump_desperate:
		// Play animation
		if (t == 0) {
			animation_play("jump");
			var _x = x, _y = y;
			move_x(320);
			var distance_to_right_side = abs(_x - x);
			x = _x;
			move_x(-320)
			var distance_to_left_side = abs(_x - x);
			x = _x;
			y = _y;
			if (distance_to_right_side > distance_to_left_side) {
				dir = 1;
				substates[0] = distance_to_right_side;
			} else {
				dir = -1;	
				substates[0] = distance_to_left_side;
			}
		}
		// Set initial vertical speed, apply gravity
		if (t == jump_wait) {
			v_speed = -jump_strength;
			grav = gravity_default;
			var dist = substates[0];
			h_speed = (dist) / (2 * abs(v_speed / grav)) * dir;
		}
		// Starting to fall
		if (t > jump_wait && v_speed >= 0) {
			state_set(chill_penguin.fall_desperate, 0, [0]);
			dir *= -1;
		}
		break;
	#endregion
	#region Falling and Shooting at the wall
	case chill_penguin.fall_desperate:
		// Play animation
		if (t == 0 || animation_end) {
			animation_play("fall");
		}
		if (substates[0] < 2 && t mod 16 == 0) {
			substates[0]++;
			animation = "";
			animation_play("fall_attack", 0);
		}
		if (substates[0] < 3 && t mod 16 == 8) {
			var shot = instance_create_depth(x + 20*dir, y, depth - 1, obj_chill_penguin_shot_3);
			shot.dir = dir;
			shot.xscale = -dir;
			if (substates[0] == 2)
				shot.angle_types = 1;
			shot.h_speed = shot.abs_hspeed*dir;
		}
		// Start land state
		if (is_on_floor() && !is_on_ceil()) {
			state_set(boss_states.land);	
			h_speed = 0;
		}
		break;
	#endregion
	#region Throw Ice
	case chill_penguin.throw_ice:
		if (t == 0) {
			animation = "";
			animation_play("throw");
			look_at_player();
			if (!can_move_x(8*dir))
				dir *= -1;
			if (substates[0] == 0)
				substates[1] = irandom_range(0, 1);
		}
		if (t == 34) {
			var shot = instance_create_depth(x + 20*dir, y, depth - 1, obj_chill_penguin_shot_1);
			shot.dir = dir;
			shot.xscale = -dir;
			if (substates[1] == 0) {
				shot.v_speed = -2;
				shot.abs_hspeed = array_get([3, 4, 5], global.difficulty);
			} else {
				shot.grav = 0;
			}
			shot.h_speed = shot.abs_hspeed * dir;
			shot.shot_type = irandom_range(0, 1);
			if (instance_exists(obj_chill_penguin_snow))
				shot.shot_type = 0;
		}
		if (t >= 54) {
			if (substates[0] < 3) {
				state_set(state, 0, [substates[0] + 1]);	
			} else {
				state_set(boss_states.idle, 0, [0, 0]);	
			}
		}
		break;
	#endregion
	#region Jump to the hook
	case chill_penguin.jump_to_hook:
		// Play animation
		if (t == 0) {
			animation_play("jump");
		}
		// Set initial vertical speed, apply gravity
		if (t == jump_wait) {
			v_speed = -jump_strength;
			grav = gravity_default;
			var dist = 2 * (hook_inst.x - x);
			dir = 1;
			if (dist < 0)
				dir = -1;
			h_speed = dist / (2 * abs(v_speed / grav));
		}
		if (place_meeting(x, y, obj_chill_penguin_hook)) {
			state_set(chill_penguin.grab_hook);
		}
		// Starting to fall
		if (t > jump_wait && v_speed >= 0) {
			state_set(boss_states.fall, 0, [0]);
		}
		break;
	#endregion
	#region Grab Hook
	case chill_penguin.grab_hook:
		v_speed = 0;
		h_speed = 0;
		grav = 0;
		if (t == 0) {
			animation_play("grab");
			x = hook_inst.x + 8 - 12*dir;
			y = hook_inst.y + 37;
		}
		if (t == 25) {
			var snow_inst = instance_create_layer(x, y, "snow", obj_chill_penguin_snow);
			snow_inst.owner = id;
			var v = view_get_rectangle();
			for (var i = 0; i < 6; i++) {
				var wall = instance_create_depth(v[0], v[1] + 16 + 32*i, depth + 1, obj_chill_penguin_wall);
				wall.image_index = 1;
				instance_create_depth(v[2] - 16, v[1] + 16 + 32*i, depth + 1, obj_chill_penguin_wall);
			}
		}
		if (animation_end) {
			state_set(boss_states.fall);
			grav = gravity_default;
		}
		break;
	#endregion
}