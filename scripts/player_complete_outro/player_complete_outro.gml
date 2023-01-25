function player_complete_outro() {
	state_set(states.idle, 0);
	if (teleport_outro) {
		substates[0] = -1; // Set idle but wait for the next state
		complete_next_state = states.outro;
		if (boss_complete_music != "")
			music_play(boss_complete_music);
	}


}
