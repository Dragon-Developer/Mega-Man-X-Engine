PAUSE;
event_inherited();
if (instance_exists(obj_chill_penguin)) {
	var inst = instance_find(obj_chill_penguin, 0);
	if (inst.state == boss_states.intro && inst.state_timer >= inst.intro_limit) {
		owner = inst;
		owner.hook_inst = id;	
	}
}

if (owner != noone) {
	if (!started) {
		started = true;
		animation_play("S");
	}
	if (owner.state == boss_states.death) {
		owner = noone;
		animation_play("D");
	}
}
animation_update(true);