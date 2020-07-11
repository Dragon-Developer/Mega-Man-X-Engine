// Loop (https://www.youtube.com/watch?v=kASnhDrj8So)
for(var i = 0; i < ds_list_size(global.audio_playing_list); i++)
{
	var audio = global.audio_playing_list[| i];
	var audio_index = audio[0], audio_asset_index = audio[1];
	
	if (!audio_is_playing(audio_index))
	{
		ds_list_delete(global.audio_playing_list, i--);
		continue;
	}
	
	var config = global.audio_configs[? audio_asset_index];
	
	if (is_undefined(config)) continue;
	
	var intro_length = config[0];
	
	if (intro_length <= 0) continue;
	
	var loop_length = config[1], total_length = config[2];
	var pos = audio_sound_get_track_position(audio_index);
	
	if (pos >= total_length)
	{
	    audio_sound_set_track_position(audio_index, pos - loop_length);
	}
}