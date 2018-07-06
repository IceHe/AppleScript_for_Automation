tell application "Finder"

	#activate

	#set targetFolder to (POSIX file "/Users/IceHe/Documents/Java") as alias
	set targetFolder to (POSIX file "/Users/IceHe/Documents/Java")

	#open targetFolder
	#reveal targetFolder

	if front Finder window exists then
		set target of front Finder window to targetFolder
	else
		open targetFolder
	end if

end tell
