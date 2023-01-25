phase = 0; // 1, 2, 3, ...
z_index = 1; // Affected Background Layer: background_(z_index)
function bg_area_update(phase = 0, z_index = 1) {
	self.phase = phase;
	self.z_index = z_index - 1;
	lay_id = layer_get_id("background_" + string(z_index));
}
bg_area_update(); // Use this for each instance