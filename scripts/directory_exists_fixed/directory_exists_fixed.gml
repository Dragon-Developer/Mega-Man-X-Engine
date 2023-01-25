function directory_exists_fixed() {
	if (os_type != os_android) {
		return directory_exists(argument[0]);	
	} else {
		return file_exists(argument[0] + "/android.txt");	
	}


}
