// Needs refactoring, add armor combo checks, put script in a better place, ...
function armor_is_full() {
	var k = argument[0];
	return (LEGS == k && BODY == k && HELM == k && string_replace(ARMS, "_s", "") == k);


}
