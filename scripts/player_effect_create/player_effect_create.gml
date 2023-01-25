function player_effect_create(effect) {

	if (!instance_exists(effect) || effect.object == noone) return noone;
	var inst = instance_create_layer(x + effect.x * dir, y + effect.y * y_dir, effect.layer, effect.object);

	inst.dir = dir;
	inst.image_xscale = dir;
	inst.image_yscale = y_dir;
	inst.owner = id;
	inst.xoffset = effect.x;
	inst.yoffset = effect.y;
	inst.local_game_speed = local_game_speed;
	inst.using_world_speed = false;

	ds_list_add(effects_list, inst);

	with(inst)
	{
	    event_perform(ev_step, ev_step_normal);
	}

	return inst;



}
