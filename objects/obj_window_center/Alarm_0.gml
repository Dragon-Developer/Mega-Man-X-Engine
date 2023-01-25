window_center();
if (window_get_y() != _y) {
	instance_create_depth(0, 0, 0, object_index);	
}
instance_destroy();