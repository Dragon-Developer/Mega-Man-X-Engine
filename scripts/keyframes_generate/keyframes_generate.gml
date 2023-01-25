/// @description Generate a key frames array by the given amount of images and speed
/// @param number_of_images
/// @param speed
function keyframes_generate(n, sp, reversed = false, offset = 0) {
	var frames = [];
	if (sp == 0) return [0, 0];
	var _sp = 1 / sp;

	for (var i = 0; i < n; i++) {
		frames[2*i] = _sp * i;
		frames[2*i + 1] = offset + i;
		if (reversed) {
			frames[2*i + 1] = offset + n - i - 1;	
		}
	}
	if (_sp != 1) {
		frames[2*n] = (_sp * n) - 1;
		frames[2*n + 1] = offset + n - 1;
		if (reversed) {
			frames[2*n + 1] = offset;	
		}
	}
	return frames;


}
