function audio_config() {
	var snd = argument[0];
	var _intro = -1;
	var _loop_end = -1;

	if (argument_count > 1){
	    _intro = argument[1];
	    _loop_end = argument[2];
	}

	global.audio_configs[? snd] = [_intro, _loop_end - _intro, _loop_end];


}
