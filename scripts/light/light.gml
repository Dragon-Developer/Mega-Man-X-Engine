enum GLOW_MODE {
	NONE,
	CIRCLE
}
function glow_init() {
	glow_in_dark = false;
	glow_in_dark_mode = 0;
	glow_circle_subtract = [
		{alpha: 0.2, radius: 46 },
		{alpha: 1, radius: 34 }
	];
}