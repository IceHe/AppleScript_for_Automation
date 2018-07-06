tell application "Finder"

	#activate

	#set target_folder to (POSIX file "/path/to/somewhere") as alias
	set target_folder to (POSIX file "/Users/IceHe/Documents/Java")

	#open target_folder
	#reveal target_folder

	if front Finder window exists then
		set target of front Finder window to target_folder
	else
		open target_folder
	end if

end tell
