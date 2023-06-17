function player_state_armor_change() {
	var t = state_timer++;

	if (t == 0) {
		animation_play("complete");
	}
	if (t == 1) {
		audio_play(snd_player_success);
		player_effect_create(complete_effect);
	}
	if (animation_on_end("complete")) {
		state_set(states.idle,0,[0]);
	}
}
