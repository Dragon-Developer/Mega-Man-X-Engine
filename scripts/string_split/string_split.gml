/// @description Separate string
/// @param string
/// @param delimitervar
/// @param keep_delimiter
function string_split() {

	var str = argument[0]; // String to split
	var delimiter = argument[1]; // Delimiter
	var let_delimiter = false; // Append delimiter to each part

	if (argument_count == 3)
	{
	    let_delimiter = argument[2];
	}

	var list = ds_list_create();
	var d_at = string_pos(delimiter, str);

	while (d_at > 0)
	{
	    var part = string_delete(str, d_at, string_length(str));
	
	    if (let_delimiter)
		{
	        part += delimiter;
		}
	
	    str = string_delete(str, 1, d_at);
	    d_at = string_pos(delimiter, str);
	    ds_list_add(list, part);
	
	    if (d_at == 0 && str != "") // Last string without delimiter, need to add too
		{
	        ds_list_add(list, str);
		}
	}
	return list;


}
