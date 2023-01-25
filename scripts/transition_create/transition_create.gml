function transition_create(type, dpt = -1000) {
	var inst = instance_create_depth(0, 0, dpt, obj_transition_effect);
	inst.transition_type = argument[0];
	inst.wait_timer = 0;
	if (type == transition_types.fade_out) {
		inst.alpha_start = 0;
	} else if (type == transition_types.fade_in) {
		inst.alpha_end = 0;
	}
	with(inst)
	{
		event_perform(ev_step, ev_step_normal);	
	}
	return inst;


}
