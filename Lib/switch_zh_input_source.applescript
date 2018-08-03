tell application "System Events"
	set inputsource to do shell script "/Users/IceHe/Documents/Tools/inputsource/inputsource"
	
	if inputsource = "com.apple.keylayout.US" then
		# https://eastmanreference.com/complete-list-of-applescript-key-codes
		key code 49 using {control down}
		#keystroke space using {control down}
		return true
	else
		return false
	end if
	
end tell