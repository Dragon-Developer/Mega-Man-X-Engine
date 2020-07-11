var inst = instance_create_layer(x, y, layer_up, argument[0]);
inst.image_xscale = dir;
inst.h_speed = inst.abs_hspeed * dir;
inst.dir = dir;
inst.owner = self;
shots_count++;
if (ds_map_exists(weapon_offset, animation_sprite_name))
{
	var l = weapon_offset[? animation_sprite_name];
	var p = l[| animation_i];
	inst.x += (p[0] + h_speed) * dir;
	inst.y += (p[1] + v_speed);
}
if (inst.execute_step_in_first_frame)
{
	with(inst)
	{
		event_perform(ev_step, ev_step_normal);	
	}
}