PAUSE;
scr_physics_update();
animation_update(true);
if (animation_end) {
	instance_destroy();	
}
image_xscale = dir;