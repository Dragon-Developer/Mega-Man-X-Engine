function pause_set() {
	G.paused = argument[0];
	if (argument_count > 1)
		G.pause_type = argument[1];
	if (!G.paused)
		G.pause_type = pause_types.none;


}
