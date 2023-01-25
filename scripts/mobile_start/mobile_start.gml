// Needs refactoring: put all functions in one script called Mobile
function mobile_start() {
	for (var i = 0; i < mobile_buttons.length; i++) {
		global.vkey[i] = -1;	
	}
	mobile_key_codes_refresh();


}
