function is_paused() {
	if (argument_count == 0)
		return G.paused;
	return (G.paused && G.pause_type == argument[0]);


}
