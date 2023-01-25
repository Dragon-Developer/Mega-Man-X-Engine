function player_get_char_id() {
	enum pl_char {
		x, zero, axl, iris, vile, megaman,
		length
	}

	switch (argument[0]) {
		case "x": return pl_char.x; break;	
		case "zero": return pl_char.zero; break;	
		case "axl": return pl_char.axl; break;	
		case "iris": return pl_char.iris; break;
		case "vile": return pl_char.vile; break;
		case "megaman": return pl_char.megaman; break;
	}


}
