enum pl_char
{
	x, zero, axl, iris
}

switch(argument[0])
{
	case "x": return pl_char.x; break;	
	case "zero": return pl_char.zero; break;	
	case "axl": return pl_char.axl; break;	
	case "iris": return pl_char.iris; break;	
}