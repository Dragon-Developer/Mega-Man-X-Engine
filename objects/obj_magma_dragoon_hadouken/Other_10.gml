var t = timer++;
if (t >= 3 && t < 13)
	y -= (t mod 5) - 2;
else if (t >= 13)
	y -= 1;
if (t == 2) {
	var inst = instance_create_depth(x + 18*dir, y_start, depth, object_index);
	inst.dir = dir;
	inst.xscale = xscale;
	inst.shot_type = shot_type + 1;
}
if (t > 12) {
	collide_damage = 0;
}
if (animation_end) {
	instance_destroy();	
}
if (shot_type > 30)
	persist = false;