function player_state_complete() {
	var t = state_timer++;

	if (t == 0) {
		animation_play("complete");
	}
	if (t == complete_effect_limit) {
		audio_play(snd_player_success);
		player_effect_create(complete_effect);
	}
	if (animation_on_end("complete")) {
		state_set(complete_next_state, 0, [0])
		if (complete_next_state == states.outro) {
			outro_animation = outro_complete_animation;	
		}
	}


}
