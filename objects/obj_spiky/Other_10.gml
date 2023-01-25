enum spiky { roll, collide, crash};
#region States
if (hp > 0 && hp <= 1 && state != spiky.crash)
	state_set(spiky.crash);
var t = state_timer++;
switch(state) {
	#region Roll
	case spiky.roll:
		animation_play("R");
		if (!can_move_x(h_speed))
			h_speed = 0;
		if (h_speed == 0 && is_on_floor())
			state_set(spiky.collide);
		break;
	#endregion
	#region Collide
	case spiky.collide:
		h_speed = 0;
		if (t == 0) {
			animation_play("C");	
			v_speed = -4;
		}
		if (t == 3)
			dir *= -1;
		if (t > 3 && v_speed > 0 && is_on_floor()) {
			v_speed = 0;
			h_speed = abs_hspeed * dir;
			state_set(spiky.roll);	
		}
		break;
	#endregion
	#region Crash
	case spiky.crash:
		if (t == 0)
			mask_index = spr_spiky_mask;
		if (t < 22)
			animation_play("D1");
		else
			animation_play("D2");
		if (h_speed != 0)
			h_speed -= dir / 24;
		if (t >= 45)
			hp = 0;
		break;
	#endregion
}
xscale = -dir;
#endregion